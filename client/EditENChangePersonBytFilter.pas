
unit EditENChangePersonBytFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENChangePersonBytController ;

type
  TfrmENChangePersonBytFilterEdit = class(TDialogForm)

    lblFio : TLabel;
    edtFio: TEdit;

    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;

    lblPackCode : TLabel;
    edtPackCode: TEdit;

    lblRegistrationNumber : TLabel;
    edtRegistrationNumber: TEdit;

    lblRegistrationDate : TLabel;
    edtRegistrationDate: TDateTimePicker;


  HTTPRIOENChangePersonByt: THTTPRIO;

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
  frmENChangePersonBytFilterEdit: TfrmENChangePersonBytFilterEdit;
  ENChangePersonBytFilterObj: ENChangePersonBytFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENChangePersonBytController  ;
}
{$R *.dfm}



procedure TfrmENChangePersonBytFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFio
      ,edtAccountNumber
      ,edtPackCode
      ,edtRegistrationNumber
      ,edtRegistrationDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtFio.Text := ENChangePersonBytObj.fio; 



    edtAccountNumber.Text := ENChangePersonBytObj.accountNumber; 



    if ( ENChangePersonBytObj.packCode <> Low(Integer) ) then
       edtPackCode.Text := IntToStr(ENChangePersonBytObj.packCode)
    else
       edtPackCode.Text := '';



    edtRegistrationNumber.Text := ENChangePersonBytObj.registrationNumber; 



      if ENChangePersonBytObj.registrationDate <> nil then
      begin
        edtRegistrationDate.DateTime:=EncodeDate(ENChangePersonBytObj.registrationDate.Year,ENChangePersonBytObj.registrationDate.Month,ENChangePersonBytObj.registrationDate.Day);
        edtRegistrationDate.checked := true;
      end
      else
      begin
        edtRegistrationDate.DateTime:=SysUtils.Date;
        edtRegistrationDate.checked := false;
      end;


  end;

}

end;



procedure TfrmENChangePersonBytFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENChangePersonBytFilterObj.fio := edtFio.Text; 



     ENChangePersonBytFilterObj.accountNumber := edtAccountNumber.Text; 



     if ( edtPackCode.Text <> '' ) then
       ENChangePersonBytFilterObj.packCode := StrToInt(edtPackCode.Text)
     else
       ENChangePersonBytFilterObj.packCode := Low(Integer) ;




     ENChangePersonBytFilterObj.registrationNumber := edtRegistrationNumber.Text; 



     if edtregistrationDate.checked then
     begin 
       if ENChangePersonBytFilterObj.registrationDate = nil then
          ENChangePersonBytFilterObj.registrationDate := TXSDate.Create;
       ENChangePersonBytFilterObj.registrationDate.XSToNative(GetXSDate(edtregistrationDate.DateTime));
     end
     else
       ENChangePersonBytFilterObj.registrationDate := nil;




  end;
end;




end.