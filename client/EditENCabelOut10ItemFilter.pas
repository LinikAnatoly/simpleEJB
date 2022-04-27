
unit EditENCabelOut10ItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelOut10ItemController ;

type
  TfrmENCabelOut10ItemFilterEdit = class(TDialogForm)


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
  frmENCabelOut10ItemFilterEdit: TfrmENCabelOut10ItemFilterEdit;
  ENCabelOut10ItemFilterObj: ENCabelOut10ItemFilter;

implementation

uses
  ShowENPost
  ,ENPostController
;

{uses  
    EnergyproController, EnergyproController2, ENCabelOut10ItemController  ;
}
{$R *.dfm}



procedure TfrmENCabelOut10ItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENCabelOut10ItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENCabelOut10ItemFilterEdit.spbENPostPostClick(Sender : TObject);
var 
   frmENPostShow: TfrmENPostShow;
begin
   frmENPostShow:=TfrmENPostShow.Create(Application,fmNormal);
   try
      with frmENPostShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCabelOut10ItemFilterObj.post = nil then ENCabelOut10ItemFilterObj.post := ENPost.Create();
               ENCabelOut10ItemFilterObj.post.code := StrToInt(GetReturnValue(sgENPost,0));
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