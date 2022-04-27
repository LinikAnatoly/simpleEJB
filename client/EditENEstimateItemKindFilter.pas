
unit EditENEstimateItemKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemKindController ;

type
  TfrmENEstimateItemKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemKind: THTTPRIO;

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
  frmENEstimateItemKindFilterEdit: TfrmENEstimateItemKindFilterEdit;
  ENEstimateItemKindFilterObj: ENEstimateItemKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemKindController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENEstimateItemKindObj.name; 


  end;

}

end;



procedure TfrmENEstimateItemKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENEstimateItemKindFilterObj.name := edtName.Text; 




  end;
end;




end.