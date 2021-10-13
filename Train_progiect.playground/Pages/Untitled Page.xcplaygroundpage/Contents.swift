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
    static var lastId = 0
    
    static func getNewID() -> String {
        lastId += 1
        return (String(lastId))
    }
    var ticketID : String = "AFNA-000\(getNewID())"
    
    // the part below for calculate cost booking ..
    //-------------------------
    init(startStation: Station, endStation : Station ,bookingType :BookingType ){
        
        self.startStation = startStation
        self.endStation = endStation
        self.bookingType = bookingType
//self.ticketID = Ticket.getNewID()
        
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
                cost = 265.0                                         //---------------------------------------
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
                cost = 215.0                                          //---------------------------------------
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
                    cost = 215.0                                    //---------------------------------------
                }
                //-------------------------------------
            }else if (self.endStation == .Makkah){
                if(self.bookingType == .Economey ){
                    cost = 200.0                                  //----------------------
                }else if(self.bookingType == .Business ){         // destination12 : from jeedah to Madinah
                    cost = 265.0                                    //---------------------------------------
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
    
    
    mutating func deletTicket ( numTicket : String ){
        
        
            
                for (index , ticket) in self.newTicket.enumerated() {
                    if( ticket.ticketID == numTicket ){
                        print("ticket id :\(ticket.ticketID) is deleting ..")
                        self.newTicket.remove(at: index)
                    }
                }
           

    }
    
    
}
//-------------------------------------------------------------------------------------------------------------------
// clasee client this a main class ,it consist client information and do some function such as :
//-add new client.       -booking new ticket .    -print details ticket .   -delet ticket.
//-search a specific ticket.    -print List client reservations.
class ReservationServices {
    
    
    //declertion Client to stor all clients reservations inside array .
    var newClient: [Client] = []
    init(){
        print("00000000000000000000000000000000000000000000000000000000000000000000")
        print("0                                                                  0")
        print("0                      Hello in AFnan Train                        0")
        print("0                                                                  0")
        print("00000000000000000000000000000000000000000000000000000000000000000000")
    }
    
    
    // function to add new client ..
    func addClient (name1 : String , name2 : String , birthyear : Int , id : Int){
        
        newClient.append(Client.init(firstName: name1, lastName: name2, birthYear: birthyear, id: id))
        print("A new customer has been added successfully \n")
    }
    
    
    //---------------------------------------------------
    //function to add ticket to a specific client
    func bookingNewTicket (from : Station , to : Station , type : BookingType, clientId : Int ) {
        var test = false
        var refrance = 0
        for (index, item) in newClient.enumerated() {
            if(item.id == clientId){
                refrance = index
                test = true
                break
            }// end if statment
        }// end for looping
        if (test == false){
            print("This client not found ,you shoud be add client first")
        }else{
        newClient[refrance].newTicket.append(Ticket(startStation: from, endStation: to, bookingType: type))
        print("Great, your reservation has been confirmed ..\n")
            print(newClient[refrance].newTicket.last?.ticketID)
            issueTicket(numTicket:  newClient[refrance].newTicket.last?.ticketID ?? ""  , clientId: clientId)
        }
/*
        var test = false
        for var item in newClient {
        if(item.id == clientId) {
              test = true
              item.newTicket.append(Ticket(startStation: from , endStation: to , bookingType: type))0
              print("Great, your reservation has been confirmed ..\n")
              issueTicket(numTicket:  item.newTicket.count-1  , clientId: clientId)
                break
          }
        }// end for looping
        if (test == false){
            print("This client not found ,you shoud be add client first")
        }
        */
    }
 
   
    
    //---------------------------------------------------
    // function to show details of ticket
    func issueTicket (numTicket : String , clientId: Int) {
        var refrance = -1
        
        for (index, item) in newClient.enumerated() {
            if(item.id == clientId) {
                refrance = index
                //print ("lam here refrenc\(refrance)  num ticket : \(numTicket)")
                break
            }
        }
        
        if (refrance >= 0) {
            if let ticketObj = newClient[refrance].newTicket.first(where: { $0.ticketID == numTicket }) {
              // print ("ticket num :\(ticketObj.ticketNumber)")
                
                print("name : \(newClient[refrance].firstName + newClient[refrance].lastName)\tDeparture station: \(ticketObj.startStation)\tArrival station: \(ticketObj.endStation)")
                
                print("Tyep : \(ticketObj.bookingType)\t    Cost :\(ticketObj.cost)     num_Teckit: \(ticketObj.ticketID)")
            } else {
                print ("ticket num not found")
            }
        } else {
            print ("Client not found")
        }
    }
    
    //---------------------------------------------------
    //function to deleting a specific ticket to a specific client
    func deletTicketById (clientId : Int , ticketId : String){
       // var clientProfile = newClient.filter{ $0.id == clientId }
        
        for (index, client) in newClient.enumerated() {
            if(client.id == clientId) {
            newClient[index].deletTicket(numTicket: ticketId)
                //print ("lam here refrenc\(refrance)  num ticket : \(numTicket)")
                break
            }
        }
        
        
    }
    
    //---------------------------------------------------
    //function To view all reservations for a specific customer
    func history(clientId : Int )
    {
        var clientTickets = newClient.filter{ $0.id == clientId }
        //print("client ticket :\(clientTickets)")
        print ("---------------------------")
        print (" Hi mr/ms: \(clientTickets[0].firstName ) ,\nThis List of your reservations : ")
        print("..............................")
        for (index, ticket)  in clientTickets[0].newTicket.enumerated() {
        
            issueTicket(numTicket : ticket.ticketID , clientId : clientId )
            print("---------------------------")
        }
    }// end function history
    //----------------------------------------------------
}// end class

var afnan = ReservationServices()

afnan.addClient(name1: "Afnan", name2: "Theb", birthyear: 1995, id: 123456)
afnan.bookingNewTicket(from :.Makkah , to : .Jeedah, type: .Economey, clientId: 123456)
afnan.bookingNewTicket(from : .Madinah, to: .KAEC, type: .Business, clientId: 123456 )


//afnan.history(clientId: 0)
//afnan.issueTicket(numTicket: 1, clientId: 123456)
//afnan.issueTicket(numTicket: 2, clientId: 123456)

//afnan.deletTicket(numTicket: 0, clientId: 0)
//afnan.history(clientId: 0)
//afnan.issueTicket(numTicket: 0, clientId: 123456)
// and time
// discount for kids

afnan.deletTicketById(clientId: 123456, ticketId: "AFNA-0001")
afnan.issueTicket(numTicket: "AFNA-0001", clientId: 123456)
//var userTicket = [].filter({$0.resvNumb == 00000000})
afnan.history(clientId: 123456)


