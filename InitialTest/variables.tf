variable "filename" {
  default     = [
    "meow.txt",
    "meow022.txt",
    "meow033.txt"
  ]
  type        = list(string)
  description = "this is filename"
}

variable "petcontent" {
  default = "i am the file pet with name as meow !!"
}

variable "dogPetFilename" {
  default = [
    "lollloll.txt",
    "lolllo1122.txt",
    "lolllo1133.txt"
    ]
  type = list(string)
}

variable "dogPetContent" {
  default = "i am the file pet with name as loll !!"
}

variable "dogNamePrefix" {
  # default = "mr"  
}

variable "dogNameSeparator" {
  # default = "-"  
}

variable "dogNameLength" {
  # default = 2 
}


