return {
  black = 0xff181926,
  white = 0xffcad3f5,
  red = 0xffed8796,
  green = 0xffa6da95,
  blue = 0xff8aadf4,
  yellow = 0xffeed49f,
  orange = 0xfff5a97f,
  magenta = 0xffc6a0f6,
  grey = 0xff939ab7,
  transparent = 0x00000000,
  fg = 0xF9A98Aff,

  bar = {
    -- bg = 0x111000ff,
    bg = 0xff000111,
    border = 0x99ffffff,
  },
  popup = {
    bg = 0x11100000,
    border = 0xffcad3f5,
  },
  bg1 = 0x803c3e4f,
  bg2 = 0xff494d64,

  rainbow = {
    0xffff007c,
    0xffc53b53,
    0xffff757f,
    0xff41a6b5,
    0xff4fd6be,
    0xffc3e88d,
    0xffffc777,
    0xff9d7cd8,
    0xffff9e64,
    0xffbb9af7,
    0xff7dcfff,
    0xff7aa2f7,
  },

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
