
unit EditENVoltageClassFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENVoltageClassController ;

type
  TfrmENVoltageClassFilterEdit = class(TDialogForm)

    lblValue : TLabel;
    edtValue: TEdit;

    lblDescription : TLabel;
    edtDescription: TEdit;



  HTTPRIOENVoltageClass: THTTPRIO;

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
  frmENVoltageClassFilterEdit: TfrmENVoltageClassFilterEdit;
  ENVoltageClassFilterObj: ENVoltageClassFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENVoltageClassController  ;
}
{$R *.dfm}



procedure TfrmENVoltageClassFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENVoltageClassObj.value <> nil ) then
       edtValue.Text := ENVoltageClassObj.value.decimalString
    else
       edtValue.Text := ''; 



    edtDescription.Text := ENVoltageClassObj.description; 


  end;

}

end;



procedure TfrmENVoltageClassFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENVoltageClass: ENVoltageClassControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENVoltageClassFilterObj.value = nil ) then
       ENVoltageClassFilterObj.value := TXSDecimal.Create;
     if edtValue.Text <> '' then
       ENVoltageClassFilterObj.value.decimalString := edtValue.Text 
     else
       ENVoltageClassFilterObj.value := nil;




     ENVoltageClassFilterObj.description := edtDescription.Text; 




  end;
end;




end.