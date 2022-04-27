
unit EditFINDocTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDocTypeController ;

type
  TfrmFINDocTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINDocType: THTTPRIO;

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
  frmFINDocTypeFilterEdit: TfrmFINDocTypeFilterEdit;
  FINDocTypeFilterObj: FINDocTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINDocTypeController  ;
}
{$R *.dfm}



procedure TfrmFINDocTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := FINDocTypeObj.name; 


  end;

}

end;



procedure TfrmFINDocTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDocType: FINDocTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINDocTypeFilterObj.name := edtName.Text; 




  end;
end;




end.