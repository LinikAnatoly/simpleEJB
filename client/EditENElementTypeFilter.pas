
unit EditENElementTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENElementTypeController ;

type
  TfrmENElementTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    HTTPRIOENElementType: THTTPRIO;

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
  frmENElementTypeFilterEdit: TfrmENElementTypeFilterEdit;
  ENElementTypeFilterObj: ENElementTypeFilter;

implementation

{uses  
    EnergyproController, EnergyproController2, ENElementTypeController  ;
}
{$R *.dfm}



procedure TfrmENElementTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENElementTypeObj.name; 


  end;

}

end;



procedure TfrmENElementTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElementType: ENElementTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENElementTypeFilterObj.name := edtName.Text; 




  end;
end;




end.