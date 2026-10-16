
CREATE TABLE Hotel (
    hotelNo VARCHAR(10) NOT NULL,
    hotelName VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    PRIMARY KEY (hotelNo)
);



CREATE TABLE Guest (
    guestNo VARCHAR(10) NOT NULL,
    guestName VARCHAR(50) NOT NULL,
    guestAddress VARCHAR(100) NOT NULL,
    PRIMARY KEY (guestNo)
);


CREATE TABLE Room (
    roomNo INT NOT NULL,
    hotelNo VARCHAR(10) NOT NULL,
    type VARCHAR(10) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (roomNo, hotelNo),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo) ON DELETE CASCADE,
    CONSTRAINT chk_room_type CHECK (type IN ('Single', 'Double', 'Family')),
    CONSTRAINT chk_room_price CHECK (price BETWEEN 10 AND 100),
    CONSTRAINT chk_room_no CHECK (roomNo BETWEEN 1 AND 100)
);


CREATE TABLE Booking (
    hotelNo VARCHAR(10) NOT NULL,
    guestNo VARCHAR(10) NOT NULL,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    roomNo INT NOT NULL,
    PRIMARY KEY (hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo),
    FOREIGN KEY (roomNo, hotelNo) REFERENCES Room(roomNo, hotelNo),
    CONSTRAINT chk_dates CHECK (dateFrom > CURRENT_DATE AND dateTo > dateFrom)
);

INSERT INTO Room (roomNo, hotelNo, type, price) 
VALUES (11, 'H1', 'Single', 5.00);