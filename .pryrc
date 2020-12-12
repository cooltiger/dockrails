if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# 色設定メソッドの定義
def Pry.set_color sym, color
    CodeRay::Encoders::Terminal::TOKEN_COLORS[sym] = color.to_s
    { sym => color.to_s }
end
  
# 色設定の変更
Pry.set_color :integer, "\e[1;36m"