
unit EditENSheets4SOTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSheets4SOTypeController ;

type
  TfrmENSheets4SOTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIOENSheets4SOType: THTTPRIO;

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
  frmENSheets4SOTypeFilterEdit: TfrmENSheets4SOTypeFilterEdit;
  ENSheets4SOTypeFilterObj: ENSheets4SOTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSheets4SOTypeController  ;
}
{$R *.dfm}



procedure TfrmENSheets4SOTypeFilterEdit.FormShow(Sender: TObject);

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

    MakeMultiline(edtName.Lines, ENSheets4SOTypeObj.name);


  end;

}

end;



procedure TfrmENSheets4SOTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSheets4SOTypeFilterObj.name := edtName.Text; 




  end;
end;




end.