
unit ShowENDocAttachment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDocAttachmentController, AdvObj ;


type
    TfrmENDocAttachmentShow = class(TChildForm)  
    HTTPRIOENDocAttachment: THTTPRIO;
    ImageList1: TImageList;
    sgENDocAttachment: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENDocAttachmentTopLeftChanged(Sender: TObject);
    procedure sgENDocAttachmentDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENDocAttachmentShort; stdcall; static;
 end;


var
  frmENDocAttachmentShow: TfrmENDocAttachmentShow;
  
  
implementation

uses Main, EditENDocAttachment, EditENDocAttachmentFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDocAttachmentHeaders: array [1..8] of String =
        ( 'Код'
          ,'Коментар до вкладення'
          ,'Посилання на файл'
          ,'Размер файла'
          ,'Користувач, що додав вкладення'
          ,'Дата додавання'
          ,'Користувач, який змінив вкладення'
          ,'Дата зміни'
        );
   
class function TfrmENDocAttachmentShow.chooseFromList : ENDocAttachmentShort;
var
  f1 : ENDocAttachmentFilter;
  frmENDocAttachmentShow : TfrmENDocAttachmentShow;
  selected : ENDocAttachmentShort;
begin
  inherited;
     selected := nil;
     f1 := ENDocAttachmentFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENDocAttachmentShow := TfrmENDocAttachmentShow.Create(Application, fmNormal, f1);
       try
          with frmENDocAttachmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENDocAttachmentShort(sgENDocAttachment.Objects[0, sgENDocAttachment.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENDocAttachmentShow.Free;
       end;
end;

procedure TfrmENDocAttachmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDocAttachmentShow:=nil;
  inherited;
end;


procedure TfrmENDocAttachmentShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDocAttachmentShow.FormShow(Sender: TObject);
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  i: Integer;
  ENDocAttachmentList: ENDocAttachmentShortList;
begin
  SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
  ColCount:=100;
  TempENDocAttachment :=  HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(ENDocAttachmentFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDocAttachmentList.list);

  if LastCount > -1 then
     sgENDocAttachment.RowCount:=LastCount+2
  else
     sgENDocAttachment.RowCount:=2;

   with sgENDocAttachment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDocAttachmentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttachmentList.list[i].commentGen;
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        Cells[2,i+1] := ENDocAttachmentList.list[i].fileLink;
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].filesize = Low(Int64) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENDocAttachmentList.list[i].filesize);
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        Cells[4,i+1] := ENDocAttachmentList.list[i].userAdd;
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].dateAdd = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        Cells[6,i+1] := ENDocAttachmentList.list[i].userGen;
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);
        Objects[0, i+1] := ENDocAttachmentList.list[i];
        LastRow:=i+1;
        sgENDocAttachment.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDocAttachment.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDocAttachment.RowCount > selectedRow then
      sgENDocAttachment.Row := selectedRow
    else
      sgENDocAttachment.Row := sgENDocAttachment.RowCount - 1;
    end
    else
      sgENDocAttachment.Row:=1;   
end;


procedure TfrmENDocAttachmentShow.sgENDocAttachmentTopLeftChanged(Sender: TObject);
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENDocAttachmentList: ENDocAttachmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDocAttachment.TopRow + sgENDocAttachment.VisibleRowCount) = ColCount
  then
    begin
      TempENDocAttachment :=  HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
      CurrentRow:=sgENDocAttachment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(ENDocAttachmentFilter(FilterObject),ColCount-1, 100);


  sgENDocAttachment.RowCount:=sgENDocAttachment.RowCount+100;
  LastCount:=High(ENDocAttachmentList.list);
  with sgENDocAttachment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDocAttachmentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDocAttachmentList.list[i].commentGen;
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        Cells[2,i+CurrentRow] := ENDocAttachmentList.list[i].fileLink;
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].filesize = Low(Int64) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENDocAttachmentList.list[i].filesize);		  
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        Cells[4,i+CurrentRow] := ENDocAttachmentList.list[i].userAdd;
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].dateAdd = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        Cells[6,i+CurrentRow] := ENDocAttachmentList.list[i].userGen;
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
        if ENDocAttachmentList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENDocAttachmentList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDocAttachment.Row:=CurrentRow-5;
   sgENDocAttachment.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDocAttachmentShow.sgENDocAttachmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDocAttachment,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDocAttachmentShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDocAttachment.RowCount-1 do
   for j:=0 to sgENDocAttachment.ColCount-1 do
     sgENDocAttachment.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDocAttachmentShow.actViewExecute(Sender: TObject);
var 
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
begin
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ENDocAttachmentObj := TempENDocAttachment.getObject(StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDocAttachmentEdit := TfrmENDocAttachmentEdit.Create(Application, dsView);
  try
    frmENDocAttachmentEdit.ShowModal;
  finally
    frmENDocAttachmentEdit.Free;
    frmENDocAttachmentEdit := nil;
  end;
end;


procedure TfrmENDocAttachmentShow.actEditExecute(Sender: TObject);
var 
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
begin
  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
  try
    ENDocAttachmentObj := TempENDocAttachment.getObject(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDocAttachment.Row;
  frmENDocAttachmentEdit:=TfrmENDocAttachmentEdit.Create(Application, dsEdit);
  
  try
    if frmENDocAttachmentEdit.ShowModal= mrOk then
      begin
        //TempENDocAttachment.save(ENDocAttachmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDocAttachmentEdit.Free;
    frmENDocAttachmentEdit:=nil;
  end;

  if sgENDocAttachment.RowCount > selectedRow then
    sgENDocAttachment.Row := selectedRow
  else
    sgENDocAttachment.Row := sgENDocAttachment.RowCount - 1;
  
end;


procedure TfrmENDocAttachmentShow.actDeleteExecute(Sender: TObject);
Var TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Вкладення документів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDocAttachment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDocAttachmentShow.actInsertExecute(Sender: TObject);
// Var TempENDocAttachment: ENDocAttachmentControllerSoapPort; 
begin
  // TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDocAttachmentObj:=ENDocAttachment.Create;
  SetNullIntProps(ENDocAttachmentObj);
  SetNullXSProps(ENDocAttachmentObj);

   //ENDocAttachmentObj.dateAdd:= TXSDateTime.Create;
   
   //ENDocAttachmentObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENDocAttachmentEdit:=TfrmENDocAttachmentEdit.Create(Application, dsInsert);
    try
      if frmENDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj<>nil then
            //TempENDocAttachment.add(ENDocAttachmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDocAttachmentEdit.Free;
      frmENDocAttachmentEdit:=nil;
    end;
  finally
    ENDocAttachmentObj.Free;
  end;
end;


procedure TfrmENDocAttachmentShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDocAttachmentShow.actFilterExecute(Sender: TObject);
begin
{frmENDocAttachmentFilterEdit:=TfrmENDocAttachmentFilterEdit.Create(Application, dsInsert);
  try
    ENDocAttachmentFilterObj := ENDocAttachmentFilter.Create;
    SetNullIntProps(ENDocAttachmentFilterObj);
    SetNullXSProps(ENDocAttachmentFilterObj);

    if frmENDocAttachmentFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDocAttachmentFilter.Create;
      FilterObject := ENDocAttachmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDocAttachmentFilterEdit.Free;
    frmENDocAttachmentFilterEdit:=nil;
  end;}
end;


procedure TfrmENDocAttachmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.