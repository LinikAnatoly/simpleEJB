
unit EditENArresterSiteFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterSiteController ;

type
  TfrmENArresterSiteFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENArresterSite: THTTPRIO;

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
  frmENArresterSiteFilterEdit: TfrmENArresterSiteFilterEdit;
  ENArresterSiteFilterObj: ENArresterSiteFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENArresterSiteController  ;
}
{$R *.dfm}



procedure TfrmENArresterSiteFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENArresterSiteObj.name; 


  end;

}

end;



procedure TfrmENArresterSiteFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArresterSite: ENArresterSiteControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENArresterSiteFilterObj.name := edtName.Text; 




  end;
end;




end.