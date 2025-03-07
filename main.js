const html = `
<div>
  <h1>Hello, from h1!</h1>
</div>
<main>
  <p>Hello, from p!</p>
</main>
<section>
  <article>More content</article>
</section>
`;

const regex = /<([\w-]+)[^>]*>[\s\S]*?<\/\1>/g;

const matches = html.match(regex);
console.log(matches);
