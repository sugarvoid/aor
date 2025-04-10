button = {}
button.__index = button

function button.new(str, pos, callback, col)
    local _b = setmetatable({}, button)
    _b.text = str
    _b.x = pos[1]
    _b.y = pos[2]
    _b.w = 50
    _b.h = 50
    _b.callback = callback
    --_b.b_color = 1
    _b.col = col
    _b.hovered = false
    _b.txt_col = 7
    return _b
end

function button:update()
    self.is_hovered = is_colliding(mx, my, self)
end

function button:get_value()
    return self.value
end

function button:was_clicked()
    self:callback()
end

function button:draw()
    rectfill(self.x, self.y, self.x + self.w, self.y + self.h, self.col)
    rect(self.x, self.y, self.x + self.w, self.y + self.h, self.col)
    print(self.text, self.x + 8, self.y + 22, self.txt_col)

    if self.is_hovered then
        rect(self.x, self.y, self.x + self.w, self.y + self.h, 7)
    end
end

function is_colliding(m_x, m_y, box)
    if m_x < box.x + box.w and
        m_x > box.x and
        m_y < box.y + box.h and
        m_y > box.y then
        return true
    else
        return false
    end
end
