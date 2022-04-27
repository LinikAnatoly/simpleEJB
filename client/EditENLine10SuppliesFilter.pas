
unit EditENLine10SuppliesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLine10SuppliesController ;

type
  TfrmENLine10SuppliesFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLine10Supplies: THTTPRIO;

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
  frmENLine10SuppliesFilterEdit: TfrmENLine10SuppliesFilterEdit;
  ENLine10SuppliesFilterObj: ENLine10SuppliesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLine10SuppliesController  ;
}
{$R *.dfm}



procedure TfrmENLine10SuppliesFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENLine10SuppliesObj.name; 


  end;

}

end;



procedure TfrmENLine10SuppliesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLine10SuppliesFilterObj.name := edtName.Text; 




  end;
end;




end.