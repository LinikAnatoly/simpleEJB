
unit EditENSettleTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettleTypeController ;

type
  TfrmENSettleTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCoef : TLabel;
    edtCoef: TEdit;



  HTTPRIOENSettleType: THTTPRIO;

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
  frmENSettleTypeFilterEdit: TfrmENSettleTypeFilterEdit;
  ENSettleTypeFilterObj: ENSettleTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSettleTypeController  ;
}
{$R *.dfm}



procedure TfrmENSettleTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSettleTypeObj.name; 



    if ( ENSettleTypeObj.coef <> nil ) then
       edtCoef.Text := ENSettleTypeObj.coef.decimalString
    else
       edtCoef.Text := ''; 


  end;

}

end;



procedure TfrmENSettleTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettleType: ENSettleTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSettleTypeFilterObj.name := edtName.Text; 



     if (ENSettleTypeFilterObj.coef = nil ) then
       ENSettleTypeFilterObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENSettleTypeFilterObj.coef.decimalString := edtCoef.Text 
     else
       ENSettleTypeFilterObj.coef := nil;





  end;
end;




end.