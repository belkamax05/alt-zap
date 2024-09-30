// import styled from '@emotion/styled';

// const StyledPage = styled.div`
//   .page {
//   }
// `;

export default function Index() {
  /*
   * Replace the elements below with your own.
   *
   * Note: The corresponding styles are in the ./index.@emotion/styled file.
   */
  return (
    <div className="wrapper">Index page. This page is under development</div>
  );
}

// export const getServerSideProps: GetServerSideProps = async ({ res }) => {
//   res.setHeader('Content-Type', 'text/plain');
//   res.write('Index page. This page is under development');
//   res.end();
//   return { props: {} };
// };

// export default function Index() {
//   return null;
// }
// export async function GET() {
//   const response = new NextResponse(
//     'Index page. This page is under development',
//     {
//       headers: {
//         'Content-Type': 'text/plain',
//       },
//     },
//   );
//   return response;
// }
