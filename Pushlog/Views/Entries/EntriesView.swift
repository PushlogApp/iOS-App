//
//  EntriesView.swift
//  Pushlog
//
//  Created by Laurens on 02.07.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct EntriesView: View {
    
    @Binding var dateFilter: DateFilter
    @Binding var entryFilter: EntryFilter
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    VStack {
                        Picker(selection: $dateFilter, label: EmptyView()) {
                            Text("Today").tag(DateFilter.Today)
                            Text("Last 7 Days").tag(DateFilter.Last7Days)
                            Text("Last Month").tag(DateFilter.LastMonth)
                            Text("Last Year").tag(DateFilter.LastYear)
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.top, 5)
                        
                        Picker(selection: $entryFilter, label: EmptyView()) {
                            Text("All").tag(EntryFilter.All)
                            Text("Info").tag(EntryFilter.Info)
                            Text("Errors").tag(EntryFilter.Errors)
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.top, 5).padding(.bottom, 10)
                    }
                    ForEach(1...10, id: \.self) {_ in
                        LogAppView(logName: "Node.JS Backend Test", type: "Error", color: Color(UIColor.systemRed), date: Date(), desc: "SSH Host Authentication Failed for this stupid backend")
                    }
                }.listRowInsets(EdgeInsets())
                    .buttonStyle(BorderlessButtonStyle())
            }.navigationBarTitle("Entries")
                .navigationViewStyle(StackNavigationViewStyle())
                .onAppear {
                    self.setupUI()
            }
        }
    }
    
    func setupUI() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
    }
    
}
