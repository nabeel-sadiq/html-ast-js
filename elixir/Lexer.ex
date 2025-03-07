defmodule Lexer do
  def ast(html) do
    regex = ~r/<(\w+)[^>]*>([\s\S]*?)<\/\1>/

    case Regex.scan(regex, html) do
      [] ->
        String.trim(html)

      matches ->
        Enum.map(matches, fn [_, tag, content] ->
          %{tag: tag, content: ast(content)}
        end)
    end
  end

  def parse(html) do
    ast(html)
    |> Enum.map(fn %{tag: tag, content: content} -> %{"document.createElement('#{tag}')"} end)
  end
end

html = """
<div>
  <h1>Hello, from h1!</h1>
</div>
<main>
  <p>Hello, from p!</p>
</main>
<section>
  <article>More content</article>
</section>
"""

Lexer.parse(html)
|> IO.inspect()
