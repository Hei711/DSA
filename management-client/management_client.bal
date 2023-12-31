 import ballerina/io;


// Creates a gRPC client to interact with the remote server.
ManagementClient ep = check new ("http://localhost:9090");
 

public function main() returns error? {

io:println(MainMenu());
    
    
}



function MainMenu() returns string|error {
    io:println("1) Login");
   
   
    string input =io:readln("Select a number_");

    if (input == "1") {
        return Login();
    }

    else {
        return Register();
    }


    
}

function Register() returns string|error {

    string UserId = io:readln("Enter User ID...");
    string Name = io:readln("Enter User Name...");
    string profile = io:readln("Enter Profile...");

    User theUser = {
        userId: UserId,
        name: Name,
        accountType: profile
    };

    string addedUser = check ep->createUser(theUser);

    io:println(addedUser);

    string input = io:readln("\n\nEnter (1) to return to Exit");

    if input == "1" {
        return Login();
    }

    return addedUser;

}

function Login() returns string|error {


    io:println("<<Login Menu>>");

    io:println("\n\n1)Student");
    io:println("2)Librarian");




    string input = io:readln("\n\nEnter user type: ");

   // User user = check ep->getUser(id);

    if (input == "1") {
        return studentMenu();
    }

    else {
        return Menu();
    }

}

function studentMenu() returns string|error {

    io:println("1) Get Available Books");
    io:println("2) Locate Book by ISBN");
    io:println("3) Borrow a Book");

    string input = io:readln("choose a Number__");

    if (input == "1") {

        string|error result = availableBook();

        return result;

    }

    if (input == "2") {

        string|error result = LocateBookByISBN();

        return result;

    }

    if (input == "3") {

        string|error result = borrowedBook();

        return result;

    }

    string inputx = io:readln("\n\nEnter (1) to return to Exit");

    if input == "1" {
        return Login();
    }

    return "Thank you for using the library";


}

function Menu() returns string|error {
   
   io:println("1) Add a User");
   io:println("2) Add a Book");
   io:println("3) Update a Book");
   io:println("4) Remove a Book");
   io:println("5) Get Available Books");
   io:println("6) Locate Book by ISBN");
   io:println("7) Borrow a Book");

  string input = io:readln("choose a Number__");

  if(input=="1") {

   string|error user = createUser();

   return user;

  }

 if(input=="2") {

   string|error result = addBook();

   return result;
  }

 if(input=="3") {

   string|error result = updateBook();

   return "updated";

  }

  if(input=="4") {

   string|error result = removeBook();

   return result;

  }

    if(input == "5")    {

        string|error result = availableBook();

        return result;

    }

    if (input == "6") {

        string|error result = LocateBookByISBN();

        return result;

    }

    if (input == "7") {

        string|error result = borrowedBook();

        return result;

    }




    return "Invalid selection try again";

}

function addBook() returns string|error{

        string Title = io:readln("Enter Book Title...");
        string Author = io:readln("Enter Authors Name...");
        string Location = io:readln("Enter the Book's location in the library...");
        string ISBN = io:readln("Enter the Book's isbn number...");
        string Status = io:readln("Is the book available?...");

         Book book = {
                  title: Title,
                  author_1: Author,
                  author_2: "",
                  location: Location,
                  isbn: ISBN,
                  status: Status
    
                };

        string addedBook = check ep->addBook(book);

    string input = io:readln("\n\nEnter (1) to return to Exit");

    if input == "1" {
        return Menu();
    }
        return addedBook;

}





function createUser() returns string|error {

string UserId = io:readln("Enter User ID...");
string Name = io:readln("Enter User Name...");
string  profile= io:readln("Enter ProfileFILE0  �k       8  x                     G     `           H      ���i���܄j�����Bj������l���                                      0   p          R           ���i������i������i������i���                       M A N A G E ~ 1       0   p          V           ���i������i������i������i���                       
M a n a g e m e n t   @   (                �l̦�[��+��܂>�   X        8       $ I 3 0 0               (   (                            �   P  @                    H                            $ I 3 0 !V    �   (               $ I 3 0        �����yG        M A N A G E ~ 1 . P R O            p Z          +��i���P��i���P��i����	�i���                       m g m n t - c l i e n t       '     p \          ܄j���܄j���܄j���܄j���                       m g m n t - s e r v i c e          h R          +��i���P��i���P��i����	�i���                       M G M N T - ~ 1                     �����y FILE0  	-       8  8                   e        `           H      qB�i���n�����������qB�i���                                      0   x          Z          qB�i���qB�i���qB�i���qB�i���                        M A N A G E ~ 1 . P R O       0   �          b          qB�i���qB�i���qB�i���qB�i���                        m a n a g e m e n t . p r o t o       �   H                         @                          !    �   X           8   Z o n e . I d  n t i f i e r   [ZoneTransfer]
ZoneId=3
      �����yG                                                                                                                                                                                                                                                                                                                                                                                                                                                                       FILE0  se       8  X                     G     `           H      +��i���P��i���P��i���hl�i���                                      0   p          R          +��i���+��i���+��i���+��i���                       M G M N T - ~ 1       0   x          Z          +��i���+��i���+��i���+��i���                       m g m n t - c l i e n t       �   X        8       $ I 3 0 0               (   (                            �   P   @                    H                           $ I 3 0 !    �   (               $ I 3 0        �����yG�U��5���*����i���                       
. g i t i g n o r e S      p ^          U�i���U�i���U�i���U�i���                        B a l l e r i n a . t o m l        p Z          u�i����U��5���0-��u�i���h       d               D E V C O N ~ 1 . J S O            h R          ��i����U��5�