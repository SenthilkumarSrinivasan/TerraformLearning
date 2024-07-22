terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "local_file" "pet" {
  filename   = var.filename[count.index]
  count = length(var.filename)
  content    = "content is coming from random which is ${random_pet.dogName.id}"
  depends_on = [random_pet.dogName]
  file_permission =  "0444"
  lifecycle {
    ignore_changes = [ file_permission ]
  }
}

resource "local_file" "dogPet" {
  filename = each.value
  content  = data.local_file.manualFile.content 
  for_each = toset(var.dogPetFilename)
}

resource "random_pet" "dogName" {
  prefix    = var.dogNamePrefix
  separator = var.dogNameSeparator
  length    = var.dogNameLength
}

data "local_file" "manualFile" {
    filename = "dataManualFile.txt"
}

output "dogName" {
  value = random_pet.dogName.id
}

output "sampleContent" {
  value = var.dogNamePrefix
}

output "pets" {
  value = local_file.pet
  sensitive = true
}