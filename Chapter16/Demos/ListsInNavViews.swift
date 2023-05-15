import SwiftUI
struct Books: Identifiable {
    var id = UUID()
    var title: String
    var summary: String
}
struct ListsInNavViews: View {
    let books: [Books] = [
        Books(title: "Fahrenheit 451", summary: "Dystopian novel about book burning"),
        Books(title: "The Martian Chronicles", summary: "Tales about the colonization of Mars"),
        Books(title: "Something Wicked This Way Comes", summary: "A sinister circus comes to town"),
        Books(title: "The Illustrated Man", summary: "Short stories revolving around a tattooed man")
    ]
    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink(destination: BookView(bookInfo: book)) {
                    Text("\(book.title)")
                }
            }.navigationBarTitle("Book List")
        }
    }
}
struct BookView: View {
    var bookInfo: Books
    var body: some View {
        VStack (spacing: 24) {
            Text("\(bookInfo.title)")
                .font(.largeTitle)
            Text("\(bookInfo.summary)")
                .font(.body)
        }
    }
}
struct ListsInNavViews_Previews: PreviewProvider {
    static var previews: some View {
        ListsInNavViews()
    }
}
