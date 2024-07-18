

resource "local_file" "pet" {
  filename   = var.filename
  content    = "content is coming from random which is ${random_pet.dogName.id}"
  depends_on = [random_pet.dogName]
  file_permission =  "0444"
  lifecycle {
    ignore_changes = [ file_permission ]
  }
}

resource "local_file" "dogPet" {
  filename = var.dogPetFilename
  content  = var.dogPetContent
}

resource "random_pet" "dogName" {
  prefix    = var.dogNamePrefix
  separator = var.dogNameSeparator
  length    = var.dogNameLength
}

output "dogName" {
  value = random_pet.dogName.id
}

output "sampleContent" {
  value = var.dogNamePrefix
}