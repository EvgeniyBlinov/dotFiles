import re
import logging

from subprocess import getoutput
# from pprint import pformat as pformat

from pynput import keyboard
from pynput.keyboard import Key

DESKTOP_REGEXP = re.compile(r'^(\d+)\s+\*', re.MULTILINE)
WM_LIST_REGEXP = re.compile(r'^(?P<wm_window_id>0x[0-9a-f]+)\s+(?P<desktop_id>\d+)',
                            re.MULTILINE)
XPROP_REGEXP = re.compile(r'^[^=]*=\s"(.*)"')
XPROP_ACTIVE_WINDOW_REGEXP = re.compile(r'^.*window id #\s(0x[0-9a-f]+)')
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class WmctrlException(Exception):
    pass


def _cmd(cmd_str):
    logger.debug("$ %s", cmd_str)
    out = getoutput(cmd_str)
    logger.debug(out)
    return out


def get_current_desktop():
    out = _cmd("wmctrl -d")
    m = DESKTOP_REGEXP.search(out)
    if not m:
        raise WmctrlException('parse error')
    return int(m.group(1))


def get_desktop_id_by_window_id(window_id):
    out = _cmd('wmctrl -l -G -p -x')
    for m in WM_LIST_REGEXP.finditer(out):
        gd = m.groupdict()
        if int(gd['wm_window_id'], 16) == window_id:
            return int(gd['desktop_id'])


def get_window_id_list():
    out = _cmd('wmctrl -l -G -p -x')
    res = []
    for m in WM_LIST_REGEXP.finditer(out):
        mg = m.groupdict()
        res.append(int(mg['wm_window_id'], 16))
    return res


def get_wm_window_role(wm_window_id):
    out = _cmd('xprop -id %s WM_WINDOW_ROLE' % hex(wm_window_id))
    m = XPROP_REGEXP.match(out)
    if not m:
        return '<unknown>'
    return m.group(1)

def get_active_window():
    out = _cmd('xprop -root _NET_ACTIVE_WINDOW')
    m = XPROP_ACTIVE_WINDOW_REGEXP.match(out)
    if m:
        return int(m.group(1), 16)


def activate(wm_window_id):
    _cmd('wmctrl -id -a %s' % hex(wm_window_id))


class WindowManager:
    def __init__(self):
        self.state = []
        self.previous_window_id = get_active_window()

    def _activate_by(self, condition_func):
        window_id_list = get_window_id_list()
        self.state = [w for w in self.state if w in window_id_list]
        self.state += [w for w in window_id_list if w not in self.state]

        i_window_ids = list(enumerate(self.state))
        if not condition_func(self.previous_window_id):
            i_window_ids = reversed(i_window_ids)

        try:
            i, w = next((i, w) for i, w in i_window_ids if condition_func(w))
        except:
            logger.error('not found')
            return

        self.state.append(w)
        del self.state[i]

        self.previous_window_id = w

        activate(w)
        return w

    def activate_by_role(self, role):
        current_desktop = get_current_desktop()
        result = self._activate_by(
            lambda x: (
                role in get_wm_window_role(x) and
                current_desktop == get_desktop_id_by_window_id(x)
            )
        )
        return result


class Hook:
    def __init__(self):
        self.window_manager = WindowManager()
        self.is_super_l_pressed = False

    def on_key_press(self, key):
        print(key)
        if key == Key.cmd:
            self.is_super_l_pressed = True

        try:
            if self.is_super_l_pressed:
                if key == Key.space:
                    self.window_manager.activate_by_role('browser')
                elif key.char == 'h':
                    self.window_manager.activate_by_role('vim')
                elif key.char == 'l':
                    self.window_manager.activate_by_role('terminal')
        except Exception:
            logger.exception("wrong key")

    def on_key_up(self, key):
        if key == Key.cmd:
            self.is_super_l_pressed = False

    def run(self):
        with keyboard.Listener(
                on_press=self.on_key_press,
                on_release=self.on_key_up) as listener:
            listener.join()

Hook().run()
