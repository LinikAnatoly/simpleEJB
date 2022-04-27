
unit EditENConnectionPowerPointFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionPowerPointController ;

type
  TfrmENConnectionPowerPointFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCoef : TLabel;
    edtCoef: TEdit;



  HTTPRIOENConnectionPowerPoint: THTTPRIO;

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
  frmENConnectionPowerPointFilterEdit: TfrmENConnectionPowerPointFilterEdit;
  ENConnectionPowerPointFilterObj: ENConnectionPowerPointFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionPowerPointController  ;
}
{$R *.dfm}



procedure TfrmENConnectionPowerPointFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtCoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENConnectionPowerPointObj.name; 



    if ( ENConnectionPowerPointObj.coef <> nil ) then
       edtCoef.Text := ENConnectionPowerPointObj.coef.decimalString
    else
       edtCoef.Text := ''; 


  end;

}

end;



procedure TfrmENConnectionPowerPointFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionPowerPointFilterObj.name := edtName.Text; 



     if (ENConnectionPowerPointFilterObj.coef = nil ) then
       ENConnectionPowerPointFilterObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENConnectionPowerPointFilterObj.coef.decimalString := edtCoef.Text 
     else
       ENConnectionPowerPointFilterObj.coef := nil;





  end;
end;




end.