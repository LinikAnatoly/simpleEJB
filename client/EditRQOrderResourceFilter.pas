
unit EditRQOrderResourceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderResourceController ;

type
  TfrmRQOrderResourceFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderResource: THTTPRIO;

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
  frmRQOrderResourceFilterEdit: TfrmRQOrderResourceFilterEdit;
  RQOrderResourceFilterObj: RQOrderResourceFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderResourceController  ;
}
{$R *.dfm}



procedure TfrmRQOrderResourceFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderResourceObj.name; 


  end;

}

end;



procedure TfrmRQOrderResourceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderResource: RQOrderResourceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderResourceFilterObj.name := edtName.Text; 




  end;
end;




end.