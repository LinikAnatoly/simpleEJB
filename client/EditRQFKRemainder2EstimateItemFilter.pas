
unit EditRQFKRemainder2EstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKRemainder2EstimateItemController ;

type
  TfrmRQFKRemainder2EstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;



  HTTPRIORQFKRemainder2EstimateItem: THTTPRIO;

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
  frmRQFKRemainder2EstimateItemFilterEdit: TfrmRQFKRemainder2EstimateItemFilterEdit;
  RQFKRemainder2EstimateItemFilterObj: RQFKRemainder2EstimateItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKRemainder2EstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQFKRemainder2EstimateItemFilterEdit.FormShow(Sender: TObject);

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

    if ( RQFKRemainder2EstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKRemainder2EstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;

}

end;



procedure TfrmRQFKRemainder2EstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQFKRemainder2EstimateItemFilterObj.countGen = nil ) then
       RQFKRemainder2EstimateItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKRemainder2EstimateItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKRemainder2EstimateItemFilterObj.countGen := nil;





  end;
end;




end.