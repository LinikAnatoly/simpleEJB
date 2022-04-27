
unit EditENPurchasesNoObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesNoObjectTypeController ;

type
  TfrmENPurchasesNoObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPurchasesNoObjectType: THTTPRIO;

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
  frmENPurchasesNoObjectTypeFilterEdit: TfrmENPurchasesNoObjectTypeFilterEdit;
  ENPurchasesNoObjectTypeFilterObj: ENPurchasesNoObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPurchasesNoObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesNoObjectTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPurchasesNoObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENPurchasesNoObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPurchasesNoObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.