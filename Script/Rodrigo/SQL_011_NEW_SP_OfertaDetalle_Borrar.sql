Create procedure OfertaDetalle_Borrar
@Id int
as
begin

DELETE dbo.OfertaDetalle WHERE IdOferta=@Id

select 'OK'

end	
