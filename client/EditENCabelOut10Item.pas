
unit EditENCabelOut10Item;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelOut10ItemController ;

type
  TfrmENCabelOut10ItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;

  lblENPostPostName : TLabel;
  edtENPostPostName : TEdit;
  spbENPostPost : TSpeedButton;
  

  HTTPRIOENCabelOut10Item: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPostPostClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCabelOut10ItemEdit: TfrmENCabelOut10ItemEdit;
  ENCabelOut10ItemObj: ENCabelOut10Item;

implementation

uses
  ShowENPost
  ,ENPostController
;

{uses  
    EnergyproController, EnergyproController2, ENCabelOut10ItemController  ;
}
{$R *.dfm}



procedure TfrmENCabelOut10ItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENPostPostName
      ,spbENPostPost
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCabelOut10ItemObj.code);

    edtENPostPostName.Text := ENCabelOut10ItemObj.post.name;

  end;
end;



procedure TfrmENCabelOut10ItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENCabelOut10ItemObj.code:=low(Integer);
      TempENCabelOut10Item.add(ENCabelOut10ItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCabelOut10Item.save(ENCabelOut10ItemObj);
    end;
  end;
end;


procedure TfrmENCabelOut10ItemEdit.spbENPostPostClick(Sender : TObject);
var 
   frmENPostShow: TfrmENPostShow;
begin
   frmENPostShow:=TfrmENPostShow.Create(Application,fmNormal);
   try
      with frmENPostShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCabelOut10ItemObj.post = nil then ENCabelOut10ItemObj.post := ENPost.Create();
               ENCabelOut10ItemObj.post.code := StrToInt(GetReturnValue(sgENPost,0));
               edtENPostPostName.Text:=GetReturnValue(sgENPost,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostShow.Free;
   end;
end;



end.