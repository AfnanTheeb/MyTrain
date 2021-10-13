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
    init (firstName : String , lastName : String , birthYear : Int , id : Int) {
        self.birthYear = birthYear
        self.lastName = lastName
        self.firstName = firstName
        self.id = id
        
    } // end function init
    //---------------------------------------------------

    
}
//-------------------------------------------------------------------------------------------------------------------
// clasee client this a main class ,it consist client information and do some function such as :
//-add new client.       -booking new ticket .    -print details ticket .   -delet ticket.
//-search a specific ticket.    -print List client reservations.
class ReservationServices {
    
    
    //declertion Client to stor all clients reservations inside array .
    var newClient: [Client] = []
    
    
    
    // function to add new client ..
    func addClient (name1 : String , name2 : String , birthyear : Int , id : Int){
        newClient.append(Client.init(firstName: name1, lastName: name2, birthYear: birthyear, id: id))
        print("A new customer has been added successfully \n")
    }
    
    
//---------------------------------------------------
//function to add ticket to a specific client
    func bookingNewTicket (from : Station , to : Station , type : BookingType, clientId : Int ){
        newClient[clientId].newTicket.append(Ticket(startStation: from , endStation: to , bookingType: type))
        print("Great, your reservation has been confirmed ..\n")
        issueTicket(numTicket: newClient[clientId].newTicket.count - 1 , clientId: clientId)
    }
    
//---------------------------------------------------
// function to show details of ticket
    func issueTicket (numTicket : Int , clientId: Int) {
        print("name : \(newClient[clientId].firstName + newClient[clientId].lastName)\tDeparture station: \(newClient[clientId].newTicket[numTicket].startStation)\tArrival station: \(newClient[clientId].newTicket[numTicket].endStation)")
        print("Tyep : \(newClient[clientId].newTicket[numTicket].bookingType)\t    Cost :\(newClient[clientId].newTicket[numTicket].cost)     num_Teckit\(numTicket)")
    }
    
//---------------------------------------------------
//function to deleting a specific ticket to a specific client
    func deletTicket ( numTicket : Int , clientId : Int){
        newClient[clientId].newTicket.remove(at: numTicket)
    }
    
//---------------------------------------------------
//function To view all reservations for a specific customer
    func history(clientId : Int )
    {
        
        print ("---------------------------")
        print (" Hi mr/ms: \(newClient[clientId].firstName ) ,\nThis List of your reservations : ")
        print("..............................")
        for (index, _)  in newClient[clientId].newTicket.enumerated() {
            
            issueTicket(numTicket : index, clientId : clientId)
            print("---------------------------")
        }
    }// end function history
    //----------------------------------------------------
}// end class

var afnan = ReservationServices()

afnan.addClient(name1: "Afnan", name2: "Theb", birthyear: 1995, id: 123456)
afnan.bookingNewTicket(from :.Makkah , to: .Jeedah, type: .Economey, clientId: 0)


afnan.bookingNewTicket(from: .Madinah, to: .KAEC, type: .Business, clientId: 0 )
afnan.history(clientId: 0)
afnan.deletTicket(numTicket: 0, clientId: 0)
afnan.history(clientId: 0)
// and time
// discount for kids



//var userTicket = [].filter({$0.resvNumb == 00000000})



