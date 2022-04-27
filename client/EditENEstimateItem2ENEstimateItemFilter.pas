
unit EditENEstimateItem2ENEstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItem2ENEstimateItemController ;

type
  TfrmENEstimateItem2ENEstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;



  HTTPRIOENEstimateItem2ENEstimateItem: THTTPRIO;

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
  frmENEstimateItem2ENEstimateItemFilterEdit: TfrmENEstimateItem2ENEstimateItemFilterEdit;
  ENEstimateItem2ENEstimateItemFilterObj: ENEstimateItem2ENEstimateItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItem2ENEstimateItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENEstimateItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := ENEstimateItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;

}

end;



procedure TfrmENEstimateItem2ENEstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENEstimateItem2ENEstimateItemFilterObj.countGen = nil ) then
       ENEstimateItem2ENEstimateItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENEstimateItem2ENEstimateItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENEstimateItem2ENEstimateItemFilterObj.countGen := nil;





  end;
end;




end.