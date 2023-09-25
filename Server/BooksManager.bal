import ballerina/grpc;

listener grpc:Listener ep = new (3001);

table<Book> key(code) BookTable = table [];

@grpc:Descriptor {value: Book_DESC}
service "BooksManager" on ep {
    // remote function createUser(UserRequest userReq) returns UserResponse|error {
    //     error? addUser = UserTable.add(userReq);
    //     if addUser is error {
    //         return addUser;
    //     } else {
    //         return {userId: addUser.userId, message: "User created successfully"};
    //     }
    // }

    remote function createBook(Book value) returns Responds|error {
        error? createNewBook = BookTable.add(value);
        if createNewBook is error {
            return createNewBook;
        } else {
            return {message: "Book created successfully"};
        }
    }
    remote function updateBook(Book value) returns Responds|error {
        error? addNewBook = BookTable.put(value);
        if addNewBook is error {
            return addNewBook;
        } else {
            return {message: "Book added successfully"};
        }
    }
    remote function getBookByCode(string value) returns Book|error {
        Book getBook = BookTable.get(value);
        if (getBook.code === "") {
            // Book defaultBook = {
            //     code: "",
            //     name: "",
            //     lecturerName: []
            // }
            // return defaultBook;
            return error("Book not found");
        } else {
            return getBook;
        }
    }
    remote function deleteBook(string value) returns Responds|error {
        Book deletedBook = BookTable.remove(value);
        return {
            message: string `${deletedBook.name} deleted successfully`
        };
    }

    remote function getAllBooks() returns stream<Book, error?>|error {
        stream<Book, error?> BookStream = stream from var Book in BookTable.toArray()
            select Book;

        return BookStream;
    }
}

