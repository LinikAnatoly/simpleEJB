unit EditENDocAttachmentType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENDocAttachmentTypeController, ExtCtrls,
  AdvObj ;

type
  TfrmENDocAttachmentTypeEdit = class(TDialogForm)


    HTTPRIOENDocAttachmentType: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    lblName: TLabel;
    edtName: TEdit;
    edtCode: TEdit;
    lblCode: TLabel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    sgENDocAttType2Action: TAdvStringGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    ActionList1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    HTTPRIOENDocAttType2Action: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure updateAttType2Action;
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENDocAttachmentTypeEdit: TfrmENDocAttachmentTypeEdit;
  ENDocAttachmentTypeObj: ENDocAttachmentType;

implementation

uses ENDocAttType2ActionController, ENDocAttachmentActionController,
  ShowENDocAttachmentAction, EditENDocAttType2Action;



{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDocAttType2ActionHeaders: array [1..2] of String =
        ( 'Код', 'Найменування дії'
        );


procedure TfrmENDocAttachmentTypeEdit.updateAttType2Action;
var
  TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
  i: Integer;
  ENDocAttType2ActionList: ENDocAttType2ActionShortList;
  AttType2ActionFilter : ENDocAttType2ActionFilter;
begin
  SetGridHeaders(ENDocAttType2ActionHeaders, sgENDocAttType2Action.ColumnHeaders);
  TempENDocAttType2Action :=  HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;

  AttType2ActionFilter := ENDocAttType2ActionFilter.Create;
  SetNullIntProps(AttType2ActionFilter);
  SetNullXSProps(AttType2ActionFilter);
  AttType2ActionFilter.typeRef := ENDocAttachmentTypeRef.Create;
  AttType2ActionFilter.typeRef.code := ENDocAttachmentTypeObj.code;

  ENDocAttType2ActionList := TempENDocAttType2Action.getScrollableFilteredList(AttType2ActionFilter,0,-1);
  LastCount:=High(ENDocAttType2ActionList.list);

  if LastCount > -1 then
     sgENDocAttType2Action.RowCount:=LastCount+2
  else
     sgENDocAttType2Action.RowCount:=2;

   with sgENDocAttType2Action do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttType2ActionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDocAttType2ActionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttType2ActionList.list[i].actionRefName;

        LastRow:=i+1;
        sgENDocAttType2Action.RowCount:=LastRow+1;
      end;

    sgENDocAttType2Action.Row:=1;

end;

procedure TfrmENDocAttachmentTypeEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENDocAttachmentTypeObj.code);
    edtName.Text := ENDocAttachmentTypeObj.name;
    actUpdateExecute(Sender);
  end;


end;



procedure TfrmENDocAttachmentTypeEdit.actDeleteExecute(Sender: TObject);
Var TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDocAttType2Action.Cells[0,sgENDocAttType2Action.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Звязок типів вкладень з діями)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDocAttType2Action.remove(ObjCode);
      updateAttType2Action;
  end;
end;

procedure TfrmENDocAttachmentTypeEdit.actInsertExecute(Sender: TObject);
var
   frmENDocAttachmentActionShow : TfrmENDocAttachmentActionShow;
   TempENDocAttType2Action : ENDocAttType2ActionControllerSoapPort;
begin

  TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
  ENDocAttType2ActionObj:=ENDocAttType2Action.Create;
  SetNullIntProps(ENDocAttType2ActionObj);
  SetNullXSProps(ENDocAttType2ActionObj);

   frmENDocAttachmentActionShow:=TfrmENDocAttachmentActionShow.Create(Application,fmNormal);
   try
      with frmENDocAttachmentActionShow do begin

        if ShowModal = mrOk then
        begin
            ENDocAttType2ActionObj.actionRef := ENDocAttachmentActionRef.Create;
            ENDocAttType2ActionObj.actionRef.code := StrToInt(GetReturnValue(sgENDocAttachmentAction,0));
            ENDocAttType2ActionObj.typeRef := ENDocAttachmentTypeRef.Create;
            ENDocAttType2ActionObj.typeRef.code := ENDocAttachmentTypeObj.code;
            TempENDocAttType2Action.add(ENDocAttType2ActionObj);
            Self.updateAttType2Action;
        end;
      end;
   finally
      frmENDocAttachmentActionShow.Free;
      frmENDocAttachmentActionShow:=nil;
   end;
end;

procedure TfrmENDocAttachmentTypeEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  updateAttType2Action;
end;

procedure TfrmENDocAttachmentTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachmentType: ENDocAttachmentTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENDocAttachmentType := HTTPRIOENDocAttachmentType as ENDocAttachmentTypeControllerSoapPort;

    ENDocAttachmentTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDocAttachmentTypeObj.code := Low(Integer);
      TempENDocAttachmentType.add(ENDocAttachmentTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDocAttachmentType.save(ENDocAttachmentTypeObj);
    end;
  end;
end;


end.
