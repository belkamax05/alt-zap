export async function GET(request: Request) {
  //   const script = `
  //     #!/bin/zsh
  //     echo "Hi there2"
  //     `;

  const script = `Hi`;

  const response = new Response(script, {
    headers: {
      'Content-Type': 'text/plain',
    },
  });
  return response;
}
