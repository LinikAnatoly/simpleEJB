
unit EditENArresterTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterTypeController ;

type
  TfrmENArresterTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENArresterType: THTTPRIO;

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
  frmENArresterTypeFilterEdit: TfrmENArresterTypeFilterEdit;
  ENArresterTypeFilterObj: ENArresterTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENArresterTypeController  ;
}
{$R *.dfm}



procedure TfrmENArresterTypeFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENArresterTypeObj.name; 


  end;

}

end;



procedure TfrmENArresterTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArresterType: ENArresterTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENArresterTypeFilterObj.name := edtName.Text; 




  end;
end;




end.