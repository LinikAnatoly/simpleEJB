
unit EditENCottageFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCottageController ;

type
  TfrmENCottageFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblNumberBeds : TLabel;
    edtNumberBeds: TEdit;

    lblDescription : TLabel;
    edtDescription: TMemo;

    lblCommentgen : TLabel;
    edtCommentgen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENCottage: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCottageFilterEdit: TfrmENCottageFilterEdit;
  ENCottageFilterObj: ENCottageFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCottageController  ;
}
{$R *.dfm}



procedure TfrmENCottageFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtNumberBeds
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENCottageObj.numberGen; 



    if ( ENCottageObj.numberBeds <> Low(Integer) ) then
       edtNumberBeds.Text := IntToStr(ENCottageObj.numberBeds)
    else
       edtNumberBeds.Text := '';



    MakeMultiline(edtDescription.Lines, ENCottageObj.description);



    MakeMultiline(edtCommentgen.Lines, ENCottageObj.commentgen);



    edtUserGen.Text := ENCottageObj.userGen; 



      if ENCottageObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENCottageObj.dateEdit.Year,ENCottageObj.dateEdit.Month,ENCottageObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENCottageFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCottage: ENCottageControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCottageFilterObj.numberGen := edtNumberGen.Text; 



     if ( edtNumberBeds.Text <> '' ) then
       ENCottageFilterObj.numberBeds := StrToInt(edtNumberBeds.Text)
     else
       ENCottageFilterObj.numberBeds := Low(Integer) ;




     ENCottageFilterObj.description := edtDescription.Text; 



     ENCottageFilterObj.commentgen := edtCommentgen.Text; 



     ENCottageFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENCottageFilterObj.dateEdit = nil then
          ENCottageFilterObj.dateEdit := TXSDateTime.Create;
       ENCottageFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENCottageFilterObj.dateEdit := nil;




  end;
end;




end.