
unit EditENCalcAdditionalItemTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcAdditionalItemTypeController ;

type
  TfrmENCalcAdditionalItemTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENCalcAdditionalItemType: THTTPRIO;

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
  frmENCalcAdditionalItemTypeFilterEdit: TfrmENCalcAdditionalItemTypeFilterEdit;
  ENCalcAdditionalItemTypeFilterObj: ENCalcAdditionalItemTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCalcAdditionalItemTypeController  ;
}
{$R *.dfm}



procedure TfrmENCalcAdditionalItemTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENCalcAdditionalItemTypeObj.name; 


  end;

}

end;



procedure TfrmENCalcAdditionalItemTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCalcAdditionalItemTypeFilterObj.name := edtName.Text; 




  end;
end;




end.