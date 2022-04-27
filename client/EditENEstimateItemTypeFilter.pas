
unit EditENEstimateItemTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemTypeController ;

type
  TfrmENEstimateItemTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemType: THTTPRIO;

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
  frmENEstimateItemTypeFilterEdit: TfrmENEstimateItemTypeFilterEdit;
  ENEstimateItemTypeFilterObj: ENEstimateItemTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemTypeController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENEstimateItemTypeObj.name; 


  end;

}

end;



procedure TfrmENEstimateItemTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENEstimateItemTypeFilterObj.name := edtName.Text; 




  end;
end;




end.