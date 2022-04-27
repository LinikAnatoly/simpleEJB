
unit ShowENFuelCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENFuelCardController, AdvObj ;


type
    TfrmENFuelCardShow = class(TChildForm)  
    HTTPRIOENFuelCard: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelCard: TAdvStringGrid;
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
    procedure sgENFuelCardTopLeftChanged(Sender: TObject);
    procedure sgENFuelCardDblClick(Sender: TObject);
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
   class function chooseFromList : ENFuelCardShort; stdcall; static;
 end;


var
  frmENFuelCardShow: TfrmENFuelCardShow;
  
  
implementation

uses Main, EditENFuelCard, EditENFuelCardFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelCardHeaders: array [1..4] of String =
        ( 'Код'
          ,'Рестраційний номер карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   
class function TfrmENFuelCardShow.chooseFromList : ENFuelCardShort;
var
  f1 : ENFuelCardFilter;
  frmENFuelCardShow : TfrmENFuelCardShow;
  selected : ENFuelCardShort;
begin
  inherited;
     selected := nil;
     f1 := ENFuelCardFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENFuelCardShow := TfrmENFuelCardShow.Create(Application, fmNormal, f1);
       try
          with frmENFuelCardShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENFuelCardShort(sgENFuelCard.Objects[0, sgENFuelCard.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENFuelCardShow.Free;
       end;
end;

procedure TfrmENFuelCardShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENFuelCardShow:=nil;
  inherited;
end;


procedure TfrmENFuelCardShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENFuelCardShow.FormShow(Sender: TObject);
var
  TempENFuelCard: ENFuelCardControllerSoapPort;
  i: Integer;
  ENFuelCardList: ENFuelCardShortList;
begin
  SetGridHeaders(ENFuelCardHeaders, sgENFuelCard.ColumnHeaders);
  ColCount:=100;
  TempENFuelCard :=  HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelCardFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelCardList := TempENFuelCard.getScrollableFilteredList(ENFuelCardFilter(FilterObject),0,ColCount);
  LastCount:=High(ENFuelCardList.list);

  if LastCount > -1 then
     sgENFuelCard.RowCount:=LastCount+2
  else
     sgENFuelCard.RowCount:=2;

   with sgENFuelCard do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelCardList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelCardList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelCardList.list[i].reg_id;
        Cells[2,i+1] := ENFuelCardList.list[i].userGen;
        if ENFuelCardList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENFuelCardList.list[i].dateEdit);
		Objects[0, i+1] := ENFuelCardList.list[i];
        LastRow:=i+1;
        sgENFuelCard.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENFuelCard.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENFuelCard.RowCount > selectedRow then
      sgENFuelCard.Row := selectedRow
    else
      sgENFuelCard.Row := sgENFuelCard.RowCount - 1;
    end
    else
      sgENFuelCard.Row:=1;   
end;


procedure TfrmENFuelCardShow.sgENFuelCardTopLeftChanged(Sender: TObject);
var
  TempENFuelCard: ENFuelCardControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelCardList: ENFuelCardShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelCard.TopRow + sgENFuelCard.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelCard :=  HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;
      CurrentRow:=sgENFuelCard.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelCardFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelCardList := TempENFuelCard.getScrollableFilteredList(ENFuelCardFilter(FilterObject),ColCount-1, 100);


  sgENFuelCard.RowCount:=sgENFuelCard.RowCount+100;
  LastCount:=High(ENFuelCardList.list);
  with sgENFuelCard do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelCardList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelCardList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuelCardList.list[i].reg_id;
        Cells[2,i+CurrentRow] := ENFuelCardList.list[i].userGen;
        if ENFuelCardList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelCardList.list[i].dateEdit);
		  Objects[0, i+CurrentRow] := ENFuelCardList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelCard.Row:=CurrentRow-5;
   sgENFuelCard.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelCardShow.sgENFuelCardDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelCard,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENFuelCardShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENFuelCard.RowCount-1 do
   for j:=0 to sgENFuelCard.ColCount-1 do
     sgENFuelCard.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENFuelCardShow.actViewExecute(Sender: TObject);
var 
  TempENFuelCard: ENFuelCardControllerSoapPort;
begin
  TempENFuelCard := HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;
  try
    ENFuelCardObj := TempENFuelCard.getObject(StrToInt(sgENFuelCard.Cells[0, sgENFuelCard.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENFuelCardEdit := TfrmENFuelCardEdit.Create(Application, dsView);
  try
    frmENFuelCardEdit.ShowModal;
  finally
    frmENFuelCardEdit.Free;
    frmENFuelCardEdit := nil;
  end;
end;


procedure TfrmENFuelCardShow.actEditExecute(Sender: TObject);
var 
  TempENFuelCard: ENFuelCardControllerSoapPort;
begin
  TempENFuelCard := HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;
  try
    ENFuelCardObj := TempENFuelCard.getObject(StrToInt(sgENFuelCard.Cells[0,sgENFuelCard.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENFuelCard.Row;
  frmENFuelCardEdit:=TfrmENFuelCardEdit.Create(Application, dsEdit);
  
  try
    if frmENFuelCardEdit.ShowModal= mrOk then
      begin
        //TempENFuelCard.save(ENFuelCardObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelCardEdit.Free;
    frmENFuelCardEdit:=nil;
  end;

  if sgENFuelCard.RowCount > selectedRow then
    sgENFuelCard.Row := selectedRow
  else
    sgENFuelCard.Row := sgENFuelCard.RowCount - 1;
  
end;


procedure TfrmENFuelCardShow.actDeleteExecute(Sender: TObject);
Var TempENFuelCard: ENFuelCardControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelCard := HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelCard.Cells[0,sgENFuelCard.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Топливная карта)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelCard.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelCardShow.actInsertExecute(Sender: TObject);
// Var TempENFuelCard: ENFuelCardControllerSoapPort; 
begin
  // TempENFuelCard := HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelCardObj:=ENFuelCard.Create;
  SetNullIntProps(ENFuelCardObj);
  SetNullXSProps(ENFuelCardObj);

   //ENFuelCardObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelCardEdit:=TfrmENFuelCardEdit.Create(Application, dsInsert);
    try
      if frmENFuelCardEdit.ShowModal = mrOk then
      begin
        if ENFuelCardObj<>nil then
            //TempENFuelCard.add(ENFuelCardObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelCardEdit.Free;
      frmENFuelCardEdit:=nil;
    end;
  finally
    ENFuelCardObj.Free;
  end;
end;


procedure TfrmENFuelCardShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENFuelCardShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelCardFilterEdit:=TfrmENFuelCardFilterEdit.Create(Application, dsInsert);
  try
    ENFuelCardFilterObj := ENFuelCardFilter.Create;
    SetNullIntProps(ENFuelCardFilterObj);
    SetNullXSProps(ENFuelCardFilterObj);

    if frmENFuelCardFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENFuelCardFilter.Create;
      FilterObject := ENFuelCardFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelCardFilterEdit.Free;
    frmENFuelCardFilterEdit:=nil;
  end;}
end;


procedure TfrmENFuelCardShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.