
unit EditENSDTUObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSDTUObjectTypeController ;

type
  TfrmENSDTUObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSDTUObjectType: THTTPRIO;

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
  frmENSDTUObjectTypeFilterEdit: TfrmENSDTUObjectTypeFilterEdit;
  ENSDTUObjectTypeFilterObj: ENSDTUObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSDTUObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENSDTUObjectTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSDTUObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENSDTUObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSDTUObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.