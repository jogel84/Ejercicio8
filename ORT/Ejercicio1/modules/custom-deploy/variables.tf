variable "imagen" {
  type = string
}  
  
variable "tamano_instancia" {
  type = string
}    

variable "zona_disponibilidad" {
  type = string
}    
  
variable "par_claves" {
  type = string
}    

variable "ids_grupo_de_seguridad" {
  type = list(string)
}    
  
variable "id_de_subnet" {
  type = string
}    
  
variable "nombre_instancia" {
  type = string
  default = "nombre_generico"
}