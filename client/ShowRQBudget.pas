
unit ShowRQBudget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQBudgetController, AdvObj ;


type
  TfrmRQBudgetShow = class(TChildForm)  
  HTTPRIORQBudget: THTTPRIO;
    ImageList1: TImageList;
    sgRQBudget: TAdvStringGrid;
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
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actApprove: TAction;
    actUnApprove: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQBudgetTopLeftChanged(Sender: TObject);
procedure sgRQBudgetDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actApproveExecute(Sender: TObject);
    procedure actUnApproveExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQBudgetShow : TfrmRQBudgetShow;
 // RQBudgetObj: RQBudget;
 // RQBudgetFilterObj: RQBudgetFilter;
  
  
implementation

uses Main, EditRQBudget, EditRQBudgetFilter, RQBudgetItemController, ShowRQBudgetItem,
  ENConsts;


{$R *.dfm}

var
  //frmRQBudgetShow : TfrmRQBudgetShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBudgetHeaders: array [1..4] of String =
        ( 'Код'
          ,'Номер'
          ,'Бюджетний період'
          ,'Статус'

        );
   

procedure TfrmRQBudgetShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQBudgetShow:=nil;
    inherited;
  end;


procedure TfrmRQBudgetShow.FormShow(Sender: TObject);
var
  TempRQBudget: RQBudgetControllerSoapPort;
  i: Integer;
  RQBudgetList: RQBudgetShortList;
  begin
  SetGridHeaders(RQBudgetHeaders, sgRQBudget.ColumnHeaders);
  ColCount:=100;
  TempRQBudget :=  HTTPRIORQBudget as RQBudgetControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQBudgetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBudgetList := TempRQBudget.getScrollableFilteredList(RQBudgetFilter(FilterObject),0,ColCount);


  LastCount:=High(RQBudgetList.list);

  if LastCount > -1 then
     sgRQBudget.RowCount:=LastCount+2
  else
     sgRQBudget.RowCount:=2;

   with sgRQBudget do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBudgetList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBudgetList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQBudgetList.list[i].numberGen;
        if RQBudgetList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQBudgetList.list[i].dateGen);

        Cells[3,i+1] := RQBudgetList.list[i].statusRefName;



        LastRow:=i+1;
        sgRQBudget.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBudget.Row:=1;
end;

procedure TfrmRQBudgetShow.sgRQBudgetTopLeftChanged(Sender: TObject);
var
  TempRQBudget: RQBudgetControllerSoapPort;
  i,CurrentRow: Integer;
  RQBudgetList: RQBudgetShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQBudget.TopRow + sgRQBudget.VisibleRowCount) = ColCount
  then
    begin
      TempRQBudget :=  HTTPRIORQBudget as RQBudgetControllerSoapPort;
      CurrentRow:=sgRQBudget.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBudgetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBudgetList := TempRQBudget.getScrollableFilteredList(RQBudgetFilter(FilterObject),ColCount-1, 100);



  sgRQBudget.RowCount:=sgRQBudget.RowCount+100;
  LastCount:=High(RQBudgetList.list);
  with sgRQBudget do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBudgetList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBudgetList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQBudgetList.list[i].numberGen;
        if RQBudgetList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQBudgetList.list[i].dateGen);

          Cells[3,i+CurrentRow] := RQBudgetList.list[i].statusRefName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBudget.Row:=CurrentRow-5;
   sgRQBudget.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBudgetShow.sgRQBudgetDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBudget,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBudgetShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBudget.RowCount-1 do
   for j:=0 to sgRQBudget.ColCount-1 do
     sgRQBudget.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQBudgetShow.actViewExecute(Sender: TObject);
Var TempRQBudget: RQBudgetControllerSoapPort;
    f : RQBudgetItemFilter;
begin
 {TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     RQBudgetObj := TempRQBudget.getObject(StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBudgetEdit:=TfrmRQBudgetEdit.Create(Application, dsView);
  try
    frmRQBudgetEdit.ShowModal;
  finally
    frmRQBudgetEdit.Free;
    frmRQBudgetEdit:=nil;
  end; }

  f := RQBudgetItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.bufgetRef := RQBudgetRef.Create;
  f.bufgetRef.code := StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]);

 // if not Assigned(frmRQBudgetItemShow) then
    frmRQBudgetItemShow := TfrmRQBudgetItemShow.Create(Application, fmChild, f);
    frmRQBudgetItemShow.Show;
end;

procedure TfrmRQBudgetShow.actEditExecute(Sender: TObject);
Var TempRQBudget: RQBudgetControllerSoapPort;
 f : RQBudgetItemFilter;
begin
{ TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     RQBudgetObj := TempRQBudget.getObject(StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBudgetEdit:=TfrmRQBudgetEdit.Create(Application, dsEdit);
  try
    if frmRQBudgetEdit.ShowModal= mrOk then
      begin
        //TempRQBudget.save(RQBudgetObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQBudgetEdit.Free;
    frmRQBudgetEdit:=nil;
  end;  }

  TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     RQBudgetObj := TempRQBudget.getObject(StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]));
   except
   on EConvertError do Exit;
  end;

  if RQBudgetObj.statusRef.code <> RQBUDGET_STATUS_DRAFT then
  begin
      Application.MessageBox(PChar('Редагування затвердженого бюджету заборонено!!!'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;


  f := RQBudgetItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.bufgetRef := RQBudgetRef.Create;
  f.bufgetRef.code := StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]);

  //if not Assigned(frmRQBudgetItemShow) then
    frmRQBudgetItemShow := TfrmRQBudgetItemShow.Create(Application, fmChild, f);
    frmRQBudgetItemShow.Show;


end;

procedure TfrmRQBudgetShow.actApproveExecute(Sender: TObject);
Var TempRQBudget: RQBudgetControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите утвердить (Бюджет) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBudget.approve(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBudgetShow.actDeleteExecute(Sender: TObject);
Var TempRQBudget: RQBudgetControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Бюджет) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBudget.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBudgetShow.actInsertExecute(Sender: TObject);
// Var TempRQBudget: RQBudgetControllerSoapPort; 
begin
  // TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQBudgetObj:=RQBudget.Create;

   //RQBudgetObj.dateGen:= TXSDate.Create;


  try
    frmRQBudgetEdit:=TfrmRQBudgetEdit.Create(Application, dsInsert);
    try
      if frmRQBudgetEdit.ShowModal = mrOk then
      begin
        if RQBudgetObj<>nil then
            //TempRQBudget.add(RQBudgetObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQBudgetEdit.Free;
      frmRQBudgetEdit:=nil;
    end;
  finally
    RQBudgetObj.Free;
  end;
end;

procedure TfrmRQBudgetShow.actUnApproveExecute(Sender: TObject);
Var TempRQBudget: RQBudgetControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBudget.Cells[0,sgRQBudget.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите отменить утверждение (Бюджет) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBudget.unApprove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBudgetShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBudgetShow.actFilterExecute(Sender: TObject);
begin
{frmRQBudgetFilterEdit:=TfrmRQBudgetFilterEdit.Create(Application, dsInsert);
  try
    RQBudgetFilterObj := RQBudgetFilter.Create;
    SetNullIntProps(RQBudgetFilterObj);
    SetNullXSProps(RQBudgetFilterObj);

    if frmRQBudgetFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQBudgetFilter.Create;
      FilterObject := RQBudgetFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQBudgetFilterEdit.Free;
    frmRQBudgetFilterEdit:=nil;
  end;}
end;

procedure TfrmRQBudgetShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.