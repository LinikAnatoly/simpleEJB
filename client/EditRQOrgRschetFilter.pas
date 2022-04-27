
unit EditRQOrgRschetFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgRschetController ;

type
  TfrmRQOrgRschetFilterEdit = class(TDialogForm)

    lblId : TLabel;
    edtId: TEdit;

    lblMfo : TLabel;
    edtMfo: TEdit;

    lblRschet : TLabel;
    edtRschet: TEdit;



  HTTPRIORQOrgRschet: THTTPRIO;

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
  frmRQOrgRschetFilterEdit: TfrmRQOrgRschetFilterEdit;
  RQOrgRschetFilterObj: RQOrgRschetFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrgRschetController  ;
}
{$R *.dfm}



procedure TfrmRQOrgRschetFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtId
      ,edtMfo
      ,edtRschet
     ]);
   end;
  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( RQOrgRschetObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrgRschetObj.id)
    else
       edtId.Text := '';
    edtMfo.Text := RQOrgRschetObj.mfo;
    edtRschet.Text := RQOrgRschetObj.rschet;
  end;
}
end;


procedure TfrmRQOrgRschetFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrgRschet: RQOrgRschetControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtId.Text <> '' ) then
       RQOrgRschetFilterObj.id := StrToInt(edtId.Text)
     else
       RQOrgRschetFilterObj.id := Low(Integer) ;
       RQOrgRschetFilterObj.mfo := edtMfo.Text;
       RQOrgRschetFilterObj.rschet := edtRschet.Text;

  end;
end;




end.