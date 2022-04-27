
unit EditENPurchasesObjectReasonFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesObjectReasonController ;

type
  TfrmENPurchasesObjectReasonFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPurchasesObjectReason: THTTPRIO;

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
  frmENPurchasesObjectReasonFilterEdit: TfrmENPurchasesObjectReasonFilterEdit;
  ENPurchasesObjectReasonFilterObj: ENPurchasesObjectReasonFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPurchasesObjectReasonController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesObjectReasonFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENPurchasesObjectReasonObj.name; 


  end;

}

end;



procedure TfrmENPurchasesObjectReasonFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPurchasesObjectReasonFilterObj.name := edtName.Text; 




  end;
end;




end.