
unit EditENPostTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPostTypeController ;

type
  TfrmENPostTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPostType: THTTPRIO;

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
  frmENPostTypeFilterEdit: TfrmENPostTypeFilterEdit;
  ENPostTypeFilterObj: ENPostTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPostTypeController  ;
}
{$R *.dfm}



procedure TfrmENPostTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPostTypeObj.name; 


  end;

}

end;



procedure TfrmENPostTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPostType: ENPostTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPostTypeFilterObj.name := edtName.Text; 




  end;
end;




end.