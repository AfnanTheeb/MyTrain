import UIKit
import Foundation

//-----------------------------------------
//   The code written by : Afnan programer
//-----------------------------------------

// First :
// Declaration the Enumerations - Stations && class Booking
enum Station {
  case Makkah
  case Jeedah         // only 4 stations of the train
  case KAEC
  case Madinah
}
//______________________________________________
// Determining the booking class / business - economy
enum BookingType {
  case Business
  case Economey
}
//______________________________________________
// create struct for ticket consist information the ticket and calculate cost for it
//
struct Ticket {
  var startStation: Station
  var endStation: Station
  var cost: Float = 0
  var bookingType: BookingType
    
    // the part below for calculate cost booking ..
    //-------------------------
    init(startStation: Station, endStation : Station ,bookingType :BookingType ){
        
    self.startStation = startStation
    self.endStation = endStation
    self.bookingType = bookingType
        
        // USE switch statment for Sort the destination station
        switch self.startStation {
//--------------------------------
case .Makkah:
//-//-//-//-//
            switch self.endStation {
            case .Jeedah: if(self.bookingType == .Economey ){
                cost = 40.0                                        // --------------------
            }else if(self.bookingType == .Business ){              // destination1 : from Makkah to jeedah
                cost = 50.0                                        //-------------------------------------
            }
                //-----------------------------------------------------
            case.KAEC :  if(self.bookingType == .Economey ) {
                cost = 90.0                                        //---------------------
            }else if(self.bookingType == .Business ){              // destination2 : from Makkah to KAEC
                cost = 115.0                                       //------------------------------------
            }
                //-----------------------------------------------------
            case .Madinah: if(self.bookingType == .Economey ){
                cost = 200.0                                       //---------------------
            }else if(self.bookingType == .Business ){              // destination3 : from Makkah to Madinah
                cost = 265                                         //---------------------------------------
            }
                //-----------------------------------------------------
            case .Makkah: break
            } // End all cases , if start from Makkah
//#################################################################
case .Jeedah:
//-//-//-//-//
            switch self.endStation {
            case .Makkah: if(self.bookingType == .Economey ){
                cost = 40.0                                         //---------------------
            }else if(self.bookingType == .Business ){               // destination4 : from jeedah to Makkah
                cost = 50.0                                         //---------------------------------------
            }
                //-------------------------------
            case.KAEC :  if(self.bookingType == .Economey ){
                cost = 50.0                                         //----------------------
            }else if(self.bookingType == .Business ){               // destination5 : from jeedah to KAEC
                cost = 65.0                                         //---------------------------------------
            }
                //-------------------------------
            case .Madinah: if(self.bookingType == .Economey ){
                cost = 150.0                                        //----------------------
            }else if(self.bookingType == .Business ){               // destination6 : from jeedah to Madinah
                cost = 215                                          //---------------------------------------
            }
                //--------------------------------
            case .Jeedah: break
            } // End all cases , if start from Jeedah
//##################################################################
case .KAEC:
//-//-//-//
            switch self.endStation {
            case .Jeedah: if(self.bookingType == .Economey ){
                cost = 50.0                                         //----------------------
            }else if(self.bookingType == .Business ){               // destination7 : from KAEC to Jeedah
                cost = 65.0                                         //---------------------------------------
            }
                //-------------------------------
            case.Makkah : if(self.bookingType == .Economey ){
                cost = 90.0                                         //----------------------
            }else if(self.bookingType == .Business ){               // destination8 : from KAEC to Makkah
                cost = 115.0                                        //---------------------------------------
            }
                //-------------------------------
            case .Madinah: if(self.bookingType == .Economey ){
                cost = 100.0                                        //----------------------
            }else if(self.bookingType == .Business ){               // destination9 : from KAEC to Madinah
                cost = 150.0                                        //---------------------------------------
            }
                //--------------------------------
            case .KAEC: break
            } // End all cases , if start from KAEC
//##################################################################
case .Madinah:
//-//-//-//-//
            if (self.endStation == .KAEC){
                if(self.bookingType == .Economey ){
                    cost = 100.0                                  //----------------------
                }else if(self.bookingType == .Business ){         // destination10 : from jeedah to Madinah
                    cost = 150.0                                  //---------------------------------------
                }
                //-------------------------------------
            }else if(self.endStation == .Jeedah){
                if(self.bookingType == .Economey ){
                    cost = 150.0                                  //----------------------
                }else if(self.bookingType == .Business ){         // destination11 : from jeedah to Madinah
                    cost = 215                                    //---------------------------------------
                }
                //-------------------------------------
            }else if (self.endStation == .Makkah){
                if(self.bookingType == .Economey ){
                    cost = 200.0                                  //----------------------
                }else if(self.bookingType == .Business ){         // destination12 : from jeedah to Madinah
                    cost = 265                                    //---------------------------------------
                }
                //-------------------------------------
            }// End all cases , if start from Madinah
        } // end of first switch
    } // end of function init
} // end struct ticket
//-------------------------------------------------------------------------------------------------------------------
//create struct for Client consist information the clients ..
struct Client {
    
    var firstName : String               // declertion client_Info .
    var lastName : String                //--------------------------
    var birthYear : Int
    let id : Int
    var age : Int {
        2021 - birthYear
    }
    //--------------------------------------------------
    // to stor all client reservations insaied array .
    var newTicket: [Ticket] = []
    //--------------------------------------------------
    init (first_name : String , last_name : String , birth_year : Int , ID : Int) {
        self.birthYear = birth_year
        self.lastName = last_name
        self.firstName = first_name
        self.id = ID
        
    } // end function init
    //---------------------------------------------------

    
}
//-------------------------------------------------------------------------------------------------------------------
// clasee client this a main class ,it consist client information and do some function such as :
//-add new client.       -booking new ticket .    -print details ticket .   -delet ticket.
//-search a specific ticket.    -print List client reservations.
class ReservationServices {
    
    
    //declertion Client to stor all clients reservations inside array .
    var new_client: [Client] = []
    
    // function to add new client ..
    func add_client (name1 : String , name2 : String , birthyear : Int , id : Int){
        new_client.append(Client.init(first_name: name1, last_name: name2, birth_year: birthyear, ID: id))
        print("done , adding new client")
    }
    
    
//---------------------------------------------------
//function to add ticket to a specific client
    func Booking_new_ticket (From : Station , To : Station , Type : BookingType, clientid : Int ){
        new_client[clientid].newTicket.append(Ticket(startStation: From , endStation: To , bookingType: Type))
        print ("Great you have new booking ,,,")
        print_ticket(num_ticket: new_client[clientid].newTicket.count - 1 , clientid: clientid)
    }
    
//---------------------------------------------------
// function to show details of ticket
    func print_ticket (num_ticket : Int , clientid: Int) {
        print("name : \(new_client[clientid].firstName + new_client[clientid].lastName)\tDeparture station: \(new_client[clientid].newTicket[num_ticket].startStation)\tArrival station: \(new_client[clientid].newTicket[num_ticket].endStation)")
        print("Tyep : \(new_client[clientid].newTicket[num_ticket].bookingType)\t    Cost :\(new_client[clientid].newTicket[num_ticket].cost)     num_Teckit\(num_ticket)")
    }
    
//---------------------------------------------------
//function to deleting a specific ticket to a specific client
    func delet_ticket ( num_ticket : Int , clientid : Int){
        new_client[clientid].newTicket.remove(at: num_ticket)
    }
    
//---------------------------------------------------
//function To view all reservations for a specific customer
    func history(clientid : Int )
    {
        
        print ("---------------------------")
        print (" Hi mr/ms: \(new_client[clientid].firstName ) ,\nThis List of your reservations : ")
        print("..............................")
        for (index, _)  in new_client[clientid].newTicket.enumerated() {
            
            print_ticket(num_ticket: index, clientid: clientid)
            print("---------------------------")
        }
    }// end function history
    //----------------------------------------------------
}// end class

var afnan = ReservationServices()

afnan.add_client(name1: "Afnan", name2: "Theb", Birthyear: 1995, id: 123456)
afnan.Booking_new_ticket(From :.Makkah , To: .Jeedah, Type: .Economey, clientid: 0)


afnan.Booking_new_ticket(From: .Madinah, To: .KAEC, Type: .Business, clientid: 0 )
afnan.history(clientid: 0)
afnan.delet_ticket(num_ticket: 0, clientid: 0)
afnan.history(clientid: 0)
// and time
// discount for kids



//var userTicket = [].filter({$0.resvNumb == 00000000})



