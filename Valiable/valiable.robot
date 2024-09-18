*** Variables ***

${URL_youtube}    https://www.youtube.com/
${babyshark_expected}    babyshark
# Post
${API_URL_GET}        https://jsonplaceholder.typicode.com/todos/1
${API_URL_POST}        https://jsonplaceholder.typicode.com/posts
${PAYLOAD}    {"title": "foo", "body": "bar", "userId": 1}
${HEADERS}    {"Content-Type": "application/json"}

# userdata
${BASE_URL}     https://jsonplaceholder.typicode.com
${POST_URL}     ${BASE_URL}/posts