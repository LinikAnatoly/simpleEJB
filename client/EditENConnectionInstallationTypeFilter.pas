
unit EditENConnectionInstallationTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionInstallationTypeController ;

type
  TfrmENConnectionInstallationTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCoef : TLabel;
    edtCoef: TEdit;



  HTTPRIOENConnectionInstallationType: THTTPRIO;

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
  frmENConnectionInstallationTypeFilterEdit: TfrmENConnectionInstallationTypeFilterEdit;
  ENConnectionInstallationTypeFilterObj: ENConnectionInstallationTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionInstallationTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionInstallationTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionInstallationTypeObj.name; 



    if ( ENConnectionInstallationTypeObj.coef <> nil ) then
       edtCoef.Text := ENConnectionInstallationTypeObj.coef.decimalString
    else
       edtCoef.Text := ''; 


  end;

}

end;



procedure TfrmENConnectionInstallationTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionInstallationTypeFilterObj.name := edtName.Text; 



     if (ENConnectionInstallationTypeFilterObj.coef = nil ) then
       ENConnectionInstallationTypeFilterObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENConnectionInstallationTypeFilterObj.coef.decimalString := edtCoef.Text 
     else
       ENConnectionInstallationTypeFilterObj.coef := nil;





  end;
end;




end.