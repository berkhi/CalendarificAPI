//
//  CalendarAPI.swift
//  CalendarificAPI
//
//  Created by BerkH on 11.04.2023.
//

import Foundation

let apiSections = ApiSections()

class CalendarAPI{
    func getData(completion: @escaping ([Holiday]?, Error?) -> Void) {
        
        let url = URL(string: "https://calendarific.com/api/v2/holidays?api_key=\(apiSections.api_key)&country=\(apiSections.country)&year=\(apiSections.year)")!
        //let url = URL(string: "https://calendarific.com/api/v2/holidays?api_key=4db599337a3ee61ea55508ef6ec5da30ac03f68b&country=TR&year=2023")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(HolidayResponse.self, from: data)
                for holiday in json.response.holidays {
                    print(holiday.name)
                }
                print("Total Holidays: \(json.response.holidays.count)")
                completion(json.response.holidays, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
            
        }
        task.resume()
    }
}
