
unit ShowENPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2, AdvObj;


type
    TfrmENPostShow = class(TChildForm)
    HTTPRIOENPost: THTTPRIO;
    ImageList1: TImageList;
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
    sgENPost: TAdvStringGrid;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENPostTopLeftChanged(Sender: TObject);
    procedure sgENPostDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);

    private
      { Private declarations }
    public
      { Public declarations }
      procedure UpdateGrid(Sender: TObject);
  end;

var frmENPostShow: TfrmENPostShow;
  codeENAirLine04,          //Код Воздушной Линии ЭлектроПередач 0,4 кВ
  codeENAirLine04Element,   //Код Элемента Воздушной ЛЭП 0,4 кВ
  codeENAirLine10,          //Код Воздушной Линии ЭлектроПередач 6 - 10 кВ
  codeENAirLine10Element,   //Код Элемента Воздушной ЛЭП 6 - 10 кВ
  codeENAirLine150,         //Код Воздушной ЛЭП 35 - 150 кВ
  codeENAirLine150Element,  //Код Элемента Воздушной ЛЭП 35 - 150 кВ
  codeRen: Integer;         //Код РЭС-а в EnergyNet
  
implementation

uses Main, EditENPost, EditENPostFilter, ENPostController,
  ENLine04Controller, ENLine10Controller, ENLine150Controller,
  ENElementController;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPostHeaders: array [1..12] of String =
        ( 'Код'
          ,'Тип опори'
          ,'Тип заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          ,'Матеріал опори'
          ,'Примітка'
          ,'ПЛ 0,4 кВ'
          ,'ПЛ 6 - 10 кВ'
          ,'ПЛ 35 - 150 кВ'
        );
   

procedure TfrmENPostShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPostShow := nil;
    inherited;
  end;


procedure TfrmENPostShow.FormShow(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;
  i: Integer;
  ENPostList: ENPostShortList;
begin
  SetGridHeaders(ENPostHeaders, sgENPost.ColumnHeaders);
  ColCount:=100;
  TempENPost :=  HTTPRIOENPost as ENPostControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPostFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPostList := TempENPost.getScrollableFilteredList(ENPostFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPostList.list);

  if LastCount > -1 then
     sgENPost.RowCount:=LastCount+2
  else
     sgENPost.RowCount:=2;

   with sgENPost do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPostList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENPostList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENPostList.list[i].postTtypeName; //Тип опори
        Cells[2, i + 1] := ENPostList.list[i].groundName; //Тип заземлення
        Cells[3, i + 1] := ENPostList.list[i].postNumberGen; //Номер опори
        if ENPostList.list[i].woodenLength = nil then
          Cells[4, i + 1] := '' //Довжина стояка, м
        else
          Cells[4, i + 1] := ENPostList.list[i].woodenLength.decimalString;
        if ENPostList.list[i].lastRepairDate = nil then
          Cells[5, i + 1] := '' //Дата останнього ремонту
        else
          Cells[5, i + 1] := XSDate2String(
            ENPostList.list[i].lastRepairDate);
        Cells[6, i + 1] := IntToSTr(ENPostList.list[i].yearSetup); //Рік встановлення
        Cells[7, i + 1] := ENPostList.list[i].materialRefName; //Матеріал опори
        Cells[8, i + 1] := ENPostList.list[i].name; //Назва опори
        Cells[9, i + 1] := ENPostList.list[i].line04RefName; //ПЛ 0,4 кВ
        Cells[10, i + 1] := ENPostList.list[i].line10RefName; //ПЛ 6 - 10 кВ
        Cells[11, i + 1] := ENPostList.list[i].line150RefName; //ПЛ 35 - 150 кВ
        LastRow := i + 1;
        sgENPost.RowCount := LastRow + 1;
      end;
   ColCount:=ColCount+1;
   sgENPost.Row:=1;
end;

procedure TfrmENPostShow.sgENPostTopLeftChanged(Sender: TObject);
var TempENPost: ENPostControllerSoapPort;
  i, CurrentRow: Integer;
  ENPostList: ENPostShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENPost.TopRow + sgENPost.VisibleRowCount) = ColCount then
    begin
      TempENPost :=  HTTPRIOENPost as ENPostControllerSoapPort;
      CurrentRow:=sgENPost.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENPostFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENPostList := TempENPost.getScrollableFilteredList(
        ENPostFilter(FilterObject), ColCount - 1, 100);

      sgENPost.RowCount:=sgENPost.RowCount+100;
      LastCount:=High(ENPostList.list);
      with sgENPost do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENPostList.list[i].code <> Low(Integer) then //Код
              Cells[0, i + CurrentRow] := IntToStr(ENPostList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENPostList.list[i].postTtypeName; //Тип опори
            Cells[2, i + CurrentRow] := ENPostList.list[i].groundName; //Тип заземлення
            Cells[3, i + CurrentRow] := ENPostList.list[i].postNumberGen; //Номер опори
            Cells[4, i + CurrentRow] := ENPostList.list[i].woodenLength.decimalString; //Довжина стояка, м
            if ENPostList.list[i].lastRepairDate = nil then
              Cells[5, i + CurrentRow] := '' //Дата останнього ремонту
            else
              Cells[5, i + CurrentRow] := XSDate2String(
                ENPostList.list[i].lastRepairDate);
            Cells[6, i + CurrentRow] := IntToSTr(ENPostList.list[i].yearSetup); //Рік встановлення
            Cells[7, i + CurrentRow] := ENPostList.list[i].materialRefName; //Матеріал опори
            Cells[8, i + CurrentRow] := ENPostList.list[i].name; //Назва опори
            Cells[9, i + CurrentRow] := ENPostList.list[i].line04RefName; //ПЛ 0,4 кВ
            Cells[10, i + CurrentRow] := ENPostList.list[i].line10RefName; //ПЛ 6 - 10 кВ
            Cells[11, i + CurrentRow] := ENPostList.list[i].line150RefName; //ПЛ 35 - 150 кВ
            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENPost.Row := CurrentRow - 5;
       sgENPost.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENPostShow.sgENPostDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPost,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPostShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPost.RowCount-1 do
   for j:=0 to sgENPost.ColCount-1 do
     sgENPost.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPostShow.actViewExecute(Sender: TObject);
Var TempENPost: ENPostControllerSoapPort;
begin
 TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
   try
     ENPostObj := TempENPost.getObject(StrToInt(sgENPost.Cells[0,sgENPost.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPostEdit:=TfrmENPostEdit.Create(Application, dsView);
  try
    frmENPostEdit.ShowModal;
  finally
    frmENPostEdit.Free;
    frmENPostEdit:=nil;
  end;
end;

procedure TfrmENPostShow.actEditExecute(Sender: TObject);
Var TempENPost: ENPostControllerSoapPort;
begin
 TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
   try
     ENPostObj := TempENPost.getObject(StrToInt(sgENPost.Cells[0,sgENPost.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPostEdit:=TfrmENPostEdit.Create(Application, dsEdit);
  try
    if frmENPostEdit.ShowModal= mrOk then
      begin
        //TempENPost.save(ENPostObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPostEdit.Free;
    frmENPostEdit:=nil;
  end;
end;

procedure TfrmENPostShow.actDeleteExecute(Sender: TObject);
Var TempENPost: ENPostControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPost.Cells[0,sgENPost.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPost.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPostShow.actInsertExecute(Sender: TObject);
//var TempENPost: ENPostControllerSoapPort;
begin
  //TempENPost := HTTPRIOENPost as ENPostControllerSoapPort; //Это уже лишнее!
  ENPostObj := ENPost.Create;
  ENPostObj.element := ENElement.Create;
  ENPostObj.element.renRef := EPRenRef.Create;

  if codeRen > 0 then
    ENPostObj.element.renRef.code := codeRen
  else
    ENPostObj.element.renRef.code := Low(Integer);

  ENPostObj.line04Ref := ENLine04Ref.Create;
  if codeENAirLine04 > 0 then
    begin
      ENPostObj.line04Ref.code := codeENAirLine04;
      if codeENAirLine04Element > 0 then
        begin
          ENPostObj.element.elementInRef := ENElementRef.Create;
          ENPostObj.element.elementInRef.code := codeENAirLine04Element;
        end; //if codeENAirLine04Element > 0 then
    end
  else
    ENPostObj.line04Ref.code := Low(Integer);

  ENPostObj.line10Ref := ENLine10Ref.Create;
  if codeENAirLine10 > 0 then
    begin
      ENPostObj.line10Ref.code := codeENAirLine10;
      if codeENAirLine10Element > 0 then
        begin
          ENPostObj.element.elementInRef := ENElementRef.Create;
          ENPostObj.element.elementInRef.code := codeENAirLine10Element;
        end; //if codeENAirLine10Element > 0 then
    end
  else
    ENPostObj.line10Ref.code := Low(Integer);

  ENPostObj.line150Ref := ENLine150Ref.Create;
  if codeENAirLine150 > 0 then
    begin
      ENPostObj.line150Ref.code := codeENAirLine150;
      if codeENAirLine150Element > 0 then
        begin
          ENPostObj.element.elementInRef := ENElementRef.Create;
          ENPostObj.element.elementInRef.code := codeENAirLine150Element;
        end; //if codeENAirLine150Element > 0 then
    end
  else
    ENPostObj.line150Ref.code := Low(Integer);

   //ENPostObj.woodenLength:= TXSDecimal.Create;
   //ENPostObj.lastRepairDate:= TXSDate.Create;

  try
    frmENPostEdit := TfrmENPostEdit.Create(Application, dsInsert);
    try
      if frmENPostEdit.ShowModal = mrOk then
        if ENPostObj <> nil then
          begin
            //TempENPost.add(ENPostObj);
            UpdateGrid(Sender);
          end; //if ENPostObj <> nil then
    finally
      frmENPostEdit.Free;
      frmENPostEdit := nil;
    end;
  finally
    ENPostObj.Free;
  end;
end;

procedure TfrmENPostShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPostShow.actFilterExecute(Sender: TObject);
begin
{frmENPostFilterEdit:=TfrmENPostFilterEdit.Create(Application, dsInsert);
  try
    ENPostFilterObj := ENPostFilter.Create;
    SetNullIntProps(ENPostFilterObj);
    SetNullXSProps(ENPostFilterObj);

    if frmENPostFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPostFilter.Create;
      FilterObject := ENPostFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPostFilterEdit.Free;
    frmENPostFilterEdit:=nil;
  end;}
end;

procedure TfrmENPostShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.