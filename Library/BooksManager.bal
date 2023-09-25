import ballerina/io;

BookManagementClient ep = check new ("http://localhost:3001");

public function main() returns error? {
    Book createBookRequest = {code: "dsa612s", name: "Distrubuted Systems and Applications"};
    Responds createBookResponse = check ep->createBook(createBookRequest);
    io:println(createBookResponse);

    Book updateBookRequest = {code: "ballerina", name: "ballerina"};
    Responds updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    string getBookByCodeRequest = "ballerina";
    Book getBookByCodeResponse = check ep->getBookByCode(getBookByCodeRequest);
    io:println(getBookByCodeResponse);

    string deleteBookRequest = "ballerina";
    Responds deleteBookResponse = check ep->deleteBook(deleteBookRequest);
    io:println(deleteBookResponse);
    stream<

Book, error?> getAllBooksResponse = check ep->getAllBooks();
    check getAllBooksResponse.forEach(function(Book value) {
        io:println(value);

    // var borrowBookResponse = check ep->borrowBooks("user123", bookcode);
    // io:println("Borrow Book Response: " + borrowBookResponse);
    });
}

