//
//  Camera.swift
//  Pompy
//
//  Created by Ash on 01/15/23.
//
import SwiftUI
import UIKit


struct Camera: View {
    @State private var iShown: Bool = true
    @State private var image: UIImage = UIImage(systemName: "scribble.variable")!
    @State private var sourceType: UIImagePickerController.SourceType = .camera
//    @EnvironmentObject var viewModel: ViewModel
//    @EnvironmentObject var controlModel: ViewControlModel
    
    @State private var name: String = "default"
    @State private var cals: String = "cal"
    
    @State var analyze = false
    
    var body: some View {
//        VStack {
//            Spacer()
//            Access(iShown: self.$iShown, myImage: self.$image, mySourceType: self.$sourceType)
//            Spacer()
//        }
//        let user = viewModel.currentUser
        ZStack {
            VStack {
                Image.init(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)

                HStack {
                    Button(action: {
                        self.iShown.toggle()
                        self.sourceType = .camera
                    }) {
                        Text("Camera")
                            .font(.system(size: 25))
                    }
                    //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    /*
                    .padding(.leading, 10)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .cornerRadius(20)
                    .tint(.yellow.opacity(1))
                    .padding()
                    .padding(.top, 10)
                     */
                    .font(.body.weight(.medium))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(.clear.opacity(0.25), lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
                    }
                    .background(.indigo)

                    Spacer().frame(width: 20)
                   
                        
//                    NavigationLink(destination: InterpretedText(isText: false), label: {
                    NavigationLink(destination: ARLingoView(), label: {
                        Text("Analyze")
                            .font(.system(size: 25))
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(.clear.opacity(0.25), lineWidth: 0)
                                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
                            }
                            .background(.indigo)
                    })
//                            Button(action: {
//                                //                        viewModel.uploadMainImage(image, "image")
//                                print("wsaasa\(image)")
//                                //                        post(TestItem(sometext: user.imageURL), name: $name, cal: $cals)
//                                sendImageURL(link: "https://firebasestorage.googleapis.com/v0/b/deltahacks-e7bbb.appspot.com/o/UBqs60s.jpg?alt=media&token=20673772-f2a6-427d-8e9e-5c9d60bdf4d6", type: "")
//                                //controlModel.isShowingAnalyze = true
//                            }) {
//                                Text("Analyze")
//                                    .font(.system(size: 25))
//                                    .padding(.vertical, 16)
//                                    .frame(maxWidth: .infinity)
//                                    .clipped()
//                                    .foregroundColor(.white)
//                                    .background {
//                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                            .stroke(.clear.opacity(0.25), lineWidth: 0)
//                                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
//                                    }
//                                    .background(.indigo)
//                            }
//                        }
//                    }
                    
                    /*
                     .padding(.leading, 10)
                     .buttonStyle(.bordered)
                     .buttonBorderShape(.capsule)
                     .cornerRadius(20)
                     .tint(.yellow.opacity(1))
                     .padding()
                     .padding(.top, 10)
                     */
                    
                    /*
                    .font(.body.weight(.medium))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(.clear.opacity(0.25), lineWidth: 0)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
                    }
                    .background(.indigo)
                    */
                }
                
                /*
                 VStack {
                     Text(name)
                         .font(.system(size: 30))

                     Text(cals)
                         .font(.system(size: 30))
                 }
                 */

               
            }

            .sheet(isPresented: $iShown) {
                //
                Access(iShown: self.$iShown, myImage: self.$image, mySourceType: self.$sourceType)
        }
            VStack {
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .font(.system(size: 40))
                        .padding(.horizontal, 3)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 10)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .cornerRadius(20)
                .tint(.black.opacity(1))
                .padding()
                .padding(.top, 1)
            }
        }
//        .fullScreenCover(isPresented: $controlModel.isShowingAnalyze, onDismiss: {}) {
//            Calories()
//        }
    }
}

struct Access: UIViewControllerRepresentable {
    
    @Binding var iShown: Bool
    @Binding var myImage: UIImage
    @Binding var mySourceType: UIImagePickerController.SourceType
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Access>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Access>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mySourceType
//        obj.delegate = context.coordinator
        return obj
    }
//
//    func makeCoordinator() -> Choose {
//        return Choose(isShown: $iShown, myImage: $myImage)
//    }
}

//struct Camera_Previews: PreviewProvider {
//    static var previews: some View {
//        //Camera()
//    }
//}
